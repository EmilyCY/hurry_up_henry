import logging
from pypicar.utility.base_service import BaseService

class FreenoveCtlService(BaseService):

    def __init__(self):
        self.log = self.add_service('freenove_ctl_svc', self)

    async def apply(self, app=None):
        self.log.debug("FreenoveCtlService::apply")

    def _is_connected(self) -> bool:
        return False

    def _get_name(self) ->str:
        return "fakepi"

    #@todo