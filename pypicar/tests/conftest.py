import logging
import pytest
import os

import connexion

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning) 

@pytest.fixture
def client(loop, aiohttp_client):
    logging.getLogger('connexion.operation').setLevel('ERROR')
    options = {
        "swagger_ui": True
        }
    specification_dir = os.path.join(os.path.dirname(__file__), '..',
                                     "src",
                                     'pypicar',
                                     'api',
                                     'openapi')
                                     
    app = connexion.AioHttpApp(__name__, specification_dir=specification_dir,
                               only_one_api=True, #@mb needs this to work
                               options=options)
    app.add_api('openapi.yaml', pythonic_params=True,
                pass_context_arg_name='request')
                
    return loop.run_until_complete(aiohttp_client(app.app))
