# coding: utf-8

import pytest
import json
from aiohttp import web

from pypicar.api.models.car_status import CarStatus
from pypicar.api.models.rotate import Rotate


async def test_drive_car(client):
    """Test case for drive_car

    Drives the car forward
    """
    headers = { 
        'X-API-KEY': 'special-key',
    }
    response = await client.request(
        method='POST',
        path='/car/drive',
        headers=headers,
        )
    assert response.status == 200, 'Response body is : ' + (await response.read()).decode('utf-8')


async def test_get_car_status(client):
    """Test case for get_car_status

    Get the status of the car.
    """
    headers = { 
        'Accept': 'application/json',
        'X-API-KEY': 'special-key',
    }
    response = await client.request(
        method='GET',
        path='/car/status',
        headers=headers,
        )
    assert response.status == 200, 'Response body is : ' + (await response.read()).decode('utf-8')


async def test_reverse_car(client):
    """Test case for reverse_car

    Drives the car backward
    """
    headers = { 
        'X-API-KEY': 'special-key',
    }
    response = await client.request(
        method='POST',
        path='/car/reverse',
        headers=headers,
        )
    assert response.status == 200, 'Response body is : ' + (await response.read()).decode('utf-8')


async def test_rotate_car(client):
    """Test case for rotate_car

    Rotates the car at an angle
    """
    body = {
      "clockwise" : True
    }

    headers = { 
        'Content-Type': 'application/json',
        'X-API-KEY': 'special-key',
    }
    response = await client.request(
        method='POST',
        path='/car/rotate',
        headers=headers,
        json=body,
        )
    assert response.status == 200, 'Response body is : ' + (await response.read()).decode('utf-8')

