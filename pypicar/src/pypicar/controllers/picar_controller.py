from typing import List, Dict
from aiohttp import web

from pypicar import util


async def get_car_status(request: web.Request, ) -> web.Response:
    """Get the status of the car.

    Gets the status of the car.


    """
    return web.Response(status=200)
