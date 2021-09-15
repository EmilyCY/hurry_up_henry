from typing import List, Dict
from aiohttp import web

from api.models.car_status import CarStatus
from api.models.rotate import Rotate
from api import util


async def drive_car(request: web.Request, ) -> web.Response:
    """Drives the car forward

    Drives the car forward


    """
    return web.Response(status=200)


async def get_car_status(request: web.Request, ) -> web.Response:
    """Get the status of the car.

    Gets the status of the car.


    """
    return web.Response(status=200)


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
