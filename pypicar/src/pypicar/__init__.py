<<<<<<< HEAD
import logging
import logging.config

import os
import asyncio
from aiohttp import web
import connexion
import aiohttp_cors
import click
import yaml
import sys
from pypicar.services.controller_svc import ControllerService
from pypicar.utility.base_world       import BaseWorld

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning) 


log_config = """
version: 1
formatters:
  simple:
    format: '%(asctime)s - %(levelname)s - %(name)s  - %(message)s'
handlers:
  console:
    class: logging.StreamHandler
    level: DEBUG
    formatter: simple
    stream: ext://sys.stdout
  file:
    class: logging.FileHandler
    level: DEBUG
    formatter: simple
    filename: 'pypicar.log'
loggers:
  pypicar:
    level: INFO
    handlers: [file,console]
    propagate: no  

  ctl_svc:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

  freenove_ctl_svc:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

  fake_ctl_svc:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

  aiohttp.access:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

  connexion.aiohttp_app:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

  aiohttp.internal:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

  aiohttp.client:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

  aiohttp.server:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

  aiohttp.web:
    level: DEBUG
    handlers: [file,console]
    propagate: no  

root:
  level: DEBUG
  handlers: [file,console]
"""

@click.command()
@click.option('-v','--verbose',  count=True, help="Enable the verbose mode")
@click.option('-l','--logdir',   required=False, help="Logging Directory")
@click.option('-p','--port',     required=False, default='8088', help="REST API port",show_default=True)
@click.option('--python-debug',   required=False, help="Enable debugging",show_default=False, is_flag=True)
@click.option('--python-debug-port',    required=False, default=5678, help="Debugger port",show_default=True)
def main(verbose,logdir, port, python_debug, python_debug_port):

    _config = yaml.safe_load(log_config)
    if logdir is not None:
        try:
            if not os.path.isdir(logdir):
                raise Exception()
            if not os.access(logdir, os.W_OK):
                raise Exception()

        except Exception as ex:
            click.echo("Either the logging dir:{pLd} does not exit or not writable".format(pLd=logdir))
            sys.exit(0)

        _config['handlers']['file']['filename'] = logdir+"/pypicar.log"
        _config['handlers']['console']['class'] = 'logging.NullHandler'
        del _config['handlers']['console']['level']
        del _config['handlers']['console']['formatter']
        del _config['handlers']['console']['stream']
    else:
        _config['handlers']['file']['class'] = 'logging.NullHandler'
        del _config['handlers']['file']['filename']
    
    logging.config.dictConfig(_config)

    logger = logging.getLogger(__name__)

    if python_debug:
        logger.info('Waiting for debugger to attach on port %s',python_debug_port)
        import debugpy
        debugpy.listen(python_debug_port)
        debugpy.wait_for_client()

    if logdir is not None:
        logger.info("LOGGING TO FILE %s/pypicar.log", logdir)

    if int(verbose) > 0:
        logger.info("logger setLevel=DEBUG")
        pypicar_logger = logging.getLogger('pypicar')
        pypicar_logger.setLevel(level="DEBUG")
        logger.info(pypicar_logger)


    # Now start all the services

    BaseWorld.apply_config('main', {'port':port, 'host':'0.0.0.0'})
    
    global ctl_svc
    ctl_svc = ControllerService()

    run_tasks(services=ctl_svc.get_services())

    pass

async def start_server():    
    logging.basicConfig(level=logging.DEBUG)


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


    # Register all routers for CORS.
    for route in list(app.app.router.routes()):
        cors.add(route)

    # https://docs.aiohttp.org/en/stable/web_advanced.html
    runner = web.AppRunner(app.app)
    await runner.setup()
    

    await web.TCPSite(runner, BaseWorld.get_config('host'), BaseWorld.get_config('port')).start()
                    
def run_tasks(services):
    loop = asyncio.get_event_loop()

    loop.run_until_complete(ctl_svc.apply(services))
    loop.run_until_complete(start_server())
    #windows hack #begin
    async def wakeup():
        while True:
            await asyncio.sleep(1)
    loop.create_task(wakeup())
    #windows hack #end
    
    try:
        logging.info('All systems ready.')
        loop.run_forever()
    except KeyboardInterrupt:
        logging.info("Closing down")
        loop.run_until_complete(services.get('ctl_svc').teardown())

=======
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
>>>>>>> origin/main
