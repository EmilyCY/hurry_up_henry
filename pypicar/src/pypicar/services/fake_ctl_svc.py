import logging
from pypicar.services.base_controller_svc import BaseController, CommandStatus, ControllerStatus
from pypicar.utility.base_service import BaseService

class FakeCtlService(BaseController):

    def __init__(self):
        self.log = self.add_service('fake_ctl_svc', self)

    async def apply(self, app=None):
        self.log.debug("FakeCtlService::apply")


    def _is_connected(self) -> bool:
        self.log.debug("FakeCtlService::_is_connected=True")
        return True

    def _get_name(self) ->str:
        return "fakepi"


    async def drive_car(self) -> CommandStatus:
        self.log.debug("FakeCtlService::drive_car")
        return CommandStatus.OK

    async def get_car_status(self) -> ControllerStatus:
        self.log.debug("FakeCtlService::get_car_status")
        return ControllerStatus.READY

    async def reverse_car(self) -> CommandStatus:
        self.log.debug("FakeCtlService::reverse_car")
        return CommandStatus.OK

    async def rotate_car(self, clockwise:bool = True) -> CommandStatus:
        self.log.debug("FreenoveCtlService::rotate_car clockwise={}".format(str(clockwise)))
        return CommandStatus.OK
