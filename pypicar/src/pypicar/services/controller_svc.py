import asyncio
from collections import namedtuple
from datetime import datetime, date
from importlib import import_module

import logging
import yaml
import sys
from pypicar.services.base_controller_svc import BaseController, CommandStatus, ControllerStatus
from pypicar.services.fake_ctl_svc import FakeCtlService
from pypicar.services.freenove_ctl_svc import FreenoveCtlService

from pypicar.utility.base_service import BaseService

Error = namedtuple('Error', ['name', 'msg'])

class ControllerService(BaseController):

    @property
    def errors(self):
        return [dict(e._asdict()) for e in self._errors]

    def __init__(self):

        #this will the first instantialised controller, or the fake
        self.ctl_impl_svc = None

        self.ctl_freenove = FreenoveCtlService()
        self.ctl_fake = FakeCtlService()

        self.log = self.add_service('ctl_svc', self)
        self.loop = asyncio.get_event_loop()
        self._errors = []

        self.log.debug("ControllerService::__init__")

    async def apply(self, services):
        #in case we need something to initialise async                
        self.log.debug("ControllerService::apply")

        try:
            await services.get('freenove_ctl_svc').apply()
            if services.get('freenove_ctl_svc')._is_connected():
                self.ctl_impl_svc : BaseController = services.get('freenove_ctl_svc')
            return
        except Exception as ex:
             self.log.info("Freenove controller not available {det}".format(det=str(ex)))


        try:
            await services.get('fake_ctl_svc').apply()
            if services.get('fake_ctl_svc')._is_connected():
                self.ctl_impl_svc : BaseController = services.get('fake_ctl_svc')
            return            
        except Exception as ex:
            self.log.error("Fake controller not available.Exiting...")
            sys.exit(0)            

    ### Overrides ###

    def _is_connected(self) -> bool:
        return self.ctl_impl_svc._is_connected()

    def _get_name(self) ->str:
        return self.ctl_impl_svc._get_name()

    async def drive_car(self) -> CommandStatus:
        self.log.debug("ControllerService::drive_car")
        return await self.ctl_impl_svc.drive_car()

    async def get_car_status(self)-> ControllerStatus:
        self.log.debug("ControllerService::get_car_status")
        return await self.ctl_impl_svc.get_car_status()

    async def reverse_car(self) -> CommandStatus:
        self.log.debug("ControllerService::reverse_car")
        return await self.ctl_impl_svc.reverse_car()

    async def rotate_car(self, clockwise:bool = True) -> CommandStatus:
        self.log.debug("ControllerService::rotate_car")
        return await self.ctl_impl_svc.rotate_car(clockwise)

    async def teardown(self, main_config_file='default'):
        self.log.debug('[!] shutting down server...good-bye')


    """ PRIVATE """
