import logging
import asyncio

from pypicar.services.base_controller_svc import CommandStatus, ControllerStatus
from pypicar.utility.base_service import BaseService

try:
    from pypicar.driver.freenove.ADC import Adc
    from pypicar.driver.freenove.Motor import Motor
except Exception as ex:
    pass

class COMMAND:

    CMD_MOTOR   = "CMD_MOTOR"
    CMD_LED     = "CMD_LED"
    CMD_LED_MOD = "CMD_LED_MOD"
    CMD_SERVO   = "CMD_SERVO"
    CMD_BUZZER  = "CMD_BUZZER"
    CMD_SONIC   = "CMD_SONIC"
    CMD_LIGHT   = "CMD_LIGHT"
    CMD_POWER   = "CMD_POWER" 
    CMD_MODE    = "CMD_MODE"

    def __init__(self):
        pass

CELL_SPEED_DELAY_S      = 0.67
CELL_ROTATE_DELAY_S     = 0.72
CELL_SPEED              = 1000
CELL_SPEED_ROTATE       = 2621
CELL_SPEED_COMPENSATION = 1000 #-500

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

            if ADC_Power < 6.5:
                self.log.debug("Voltage indicates lower voltage. Disconnected.")
                return False

            self.log.debug("power="+str(ADC_Power))
        except Exception as ex:
            return False

        return True

    def _get_name(self) ->str:
        return "freenove"

    async def _freenove_stop_car(self):
        self.pwm.setMotorModel(0,0,0,0)

    async def _freenove_drive_forward(self):
        await self._freenove_stop_car()
        self.pwm.setMotorModel((-1)*CELL_SPEED,(-1)*CELL_SPEED,(-1)*CELL_SPEED,(-1)*CELL_SPEED)
        await asyncio.sleep(CELL_SPEED_DELAY_S)
        await self._freenove_stop_car()

    async def _freenove_drive_back(self):
        await self._freenove_stop_car()
        self.pwm.setMotorModel(CELL_SPEED,CELL_SPEED,CELL_SPEED,CELL_SPEED)
        await asyncio.sleep(CELL_SPEED_DELAY_S)
        await self._freenove_stop_car()

    async def _freenove_rotate(self, clockwise=True):
        await self._freenove_stop_car()
        if clockwise:
            self.pwm.setMotorModel((-1)*CELL_SPEED_ROTATE,(-1)*CELL_SPEED_ROTATE,CELL_SPEED_ROTATE-CELL_SPEED_COMPENSATION,CELL_SPEED_ROTATE-CELL_SPEED_COMPENSATION)
        else:
            #todo
            self.pwm.setMotorModel(CELL_SPEED_ROTATE,CELL_SPEED_ROTATE,(-1)*(CELL_SPEED_ROTATE-CELL_SPEED_COMPENSATION),(-1)*(CELL_SPEED_ROTATE-CELL_SPEED_COMPENSATION))

        await asyncio.sleep(CELL_ROTATE_DELAY_S)
        await self._freenove_stop_car()

    async def drive_car(self) -> CommandStatus:
        self.log.debug("FreenoveCtlService::drive_car")

        try:
            await self._freenove_drive_forward()
        except Exception as ex:
            self.log.error("drive_car error={}".format(str(ex)))
            pass

        return CommandStatus.OK

    async def get_car_status(self) -> ControllerStatus:
        self.log.debug("FreenoveCtlService::get_car_status")        
        return ControllerStatus.READY

    async def reverse_car(self) -> CommandStatus:
        self.log.debug("FreenoveCtlService::reverse_car")
        try:
            await self._freenove_drive_back()
        except Exception as ex:
            self.log.error("reverse_car error={}".format(str(ex)))
            pass

        return CommandStatus.OK

    async def rotate_car(self, clockwise:bool = True) -> CommandStatus:
        self.log.debug("FreenoveCtlService::rotate_car clockwise={}".format(str(clockwise)))

        try:
            await self._freenove_rotate(clockwise)
        except Exception as ex:
            self.log.error("drive_car error={}".format(str(ex)))
            pass

        return CommandStatus.OK
