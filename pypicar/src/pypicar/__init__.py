import os
import connexion
import aiohttp_cors
import logging

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning) 

def main():

    options = {
        "swagger_ui": True
        }

    specification_dir = os.path.join(os.path.dirname(__file__), 'api/openapi')

    app = connexion.AioHttpApp(__name__, only_one_api=True, specification_dir=specification_dir, options=options)
    app.add_api('openapi.yaml',
                arguments={'title': 'Hurry up Henry'},
                pythonic_params=True,
                pass_context_arg_name='request')

    # Enable CORS for all origins.
    cors = aiohttp_cors.setup(app.app, defaults={
        "*": aiohttp_cors.ResourceOptions(
            allow_credentials=True,
            expose_headers="*",
            allow_headers="*",
        )
    })

    logging.basicConfig(level=logging.DEBUG)
    
    # Register all routers for CORS.
    for route in list(app.app.router.routes()):
        cors.add(route)

    app.run(port=8088)
