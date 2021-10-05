import logging
import asyncio

from pypicar.services.base_controller_svc import CommandStatus, ControllerStatus
from pypicar.utility.base_service import BaseService

from pypicar.driver.freenove.ADC import Adc
from pypicar.driver.freenove.Motor import Motor

class COMMAND:
    CMD_MOTOR = "CMD_MOTOR"
    CMD_LED = "CMD_LED"
    CMD_LED_MOD = "CMD_LED_MOD"
    CMD_SERVO = "CMD_SERVO"
    CMD_BUZZER = "CMD_BUZZER"
    CMD_SONIC = "CMD_SONIC"
    CMD_LIGHT = "CMD_LIGHT"
    CMD_POWER = "CMD_POWER" 
    CMD_MODE ="CMD_MODE"
    def __init__(self):
        pass

class FreenoveCtlService(BaseService):

    def __init__(self):
        self.log = self.add_service('freenove_ctl_svc', self)

    async def apply(self, app=None):
        self.log.debug("FreenoveCtlService::apply")
        self.adc=Adc()
        self.pwm=Motor()

    def _is_connected(self) -> bool:
        """

        """
        self.log.debug("FreenoveCtlService _is_connected")
        try:
            ADC_Power=self.adc.recvADC(2)*3
            self.log.debug("power="+str(ADC_Power))
        except Exception as ex:
            return False

        return True

    def _get_name(self) ->str:
        return "freenove"

    async def _freenove_stop_car(self):
        self.pwm.setMotorModel(2000,2000,-500,-500)       #Right    
        await asyncio.sleep(1)
        self.pwm.setMotorModel(0,0,0,0)                   #Stop

    async def drive_car(self) -> CommandStatus:
        self.log.debug("FreenoveCtlService::drive_car")

        try:
            await self._freenove_stop_car()
        except Exception as ex:
            self.log.error("drive_car error={}".format(str(ex)))
            pass

        return CommandStatus.OK

    async def get_car_status(self) -> ControllerStatus:
        self.log.debug("FreenoveCtlService::get_car_status")
        return ControllerStatus.READY

    async def reverse_car(self) -> CommandStatus:
        self.log.debug("FreenoveCtlService::reverse_car")
        return CommandStatus.OK

    async def rotate_car(self) -> CommandStatus:
        self.log.debug("FreenoveCtlService::rotate_car")
        return CommandStatus.OK
