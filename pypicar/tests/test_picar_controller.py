# coding: utf-8

import pytest
import json
from aiohttp import web



async def test_get_car_status(client):
    """Test case for get_car_status

    Get the status of the car.
    """
    headers = { 
    }
    response = await client.request(
        method='GET',
        path='/v1/car/status',
        headers=headers,
        )
    assert response.status == 200, 'Response body is : ' + (await response.read()).decode('utf-8')

