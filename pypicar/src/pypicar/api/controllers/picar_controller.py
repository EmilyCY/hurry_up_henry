from typing import List, Dict
from aiohttp import web
from click.core import Command

from pypicar.api.models.car_status import CarStatus
from pypicar.api.models.rotate import Rotate
from pypicar.api import util
from pypicar.services.base_controller_svc import CommandStatus, ControllerStatus
from pypicar.utility.base_service import BaseService
from pypicar.utility.base_world import BaseWorld

import logging

async def drive_car(request: web.Request, ) -> web.Response:
    """Drives the car forward

    Drives the car forward


    """
    svc = BaseService.get_service('ctl_svc')

    try:
        result : CommandStatus = await svc.drive_car()
    except Exception as ex:
        logging.error(ex)

    return web.Response(status=200)


async def get_car_status(request: web.Request, ) -> web.Response:
    """Get the status of the car.

    Gets the status of the car.

    """
    svc = BaseService.get_service('ctl_svc')
    if (not svc):
        logging.error("Controller service not available")
    
    try:
        status : ControllerStatus = await svc.get_car_status()
    except Exception as ex:
        logging.error(ex)

    if (status == ControllerStatus.BUSY):
        str_status = "BUSY"
    elif (status == ControllerStatus.READY):
        str_status = "READY"

    st_mock =  CarStatus(name=svc._get_name(), status=str(str_status))
    return web.Response(body=st_mock.to_str(), status=200)

async def reverse_car(request: web.Request, ) -> web.Response:
    """Drives the car backward

    Drives the car backwards


    """
    return web.Response(status=200)


async def rotate_car(request: web.Request, body=None) -> web.Response:
    """Rotates the car at an angle

    Rotates the car at an angle

    :param body: 
    :type body: dict | bytes

    """
    body = Rotate.from_dict(body)
    return web.Response(status=200)
