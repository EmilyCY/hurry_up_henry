import logging
from pypicar.utility.base_service import BaseService

from pypicar.driver.freenove.ADC import Adc

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

    def _is_connected(self) -> bool:
        """

        """
        ADC_Power=self.adc.recvADC(2)*3
        self.log.debug(ADC_Power)

        return True

    def _get_name(self) ->str:
        return "freenove"

    #@todo