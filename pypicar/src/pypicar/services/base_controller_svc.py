import logging
import abc
from enum import Enum
from pypicar.utility.base_service import BaseService

class ControllerStatus(Enum):
    READY   = "READY",
    BUSY    = "BUSY",
    UNKNOWN = "UNKNOWN"

class CommandStatus(Enum):
    OK   = 1, 
    FAIL = 0,
    BUSY = 2,
    #whatever else

class BaseController(BaseService, metaclass=abc.ABCMeta):

    def __init__(self):
        self.log = self.add_service('base_ctl_svc', self)

    @abc.abstractmethod
    def _is_connected(self):
        return False

    @abc.abstractmethod
    async def apply(self, app=None):
        self.log.debug("BaseController::apply")


    @abc.abstractmethod
    async def drive_car(self):
        pass

    @abc.abstractmethod
    async def get_car_status(self) -> ControllerStatus:
        return ControllerStatus.READY

    @abc.abstractmethod
    async def reverse_car(self):
        pass

    @abc.abstractmethod
    async def rotate_car(self):
        pass

