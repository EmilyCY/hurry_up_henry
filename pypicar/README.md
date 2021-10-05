# PYthon PI car backend server for Hurry up Henry

## Overview
@todo I'll draw some diagram here

## Requirements
Python 3.9

## Usage
Create a new venv and install dependencies

```
python3 -mvenv venv
```

Activate the virtual environment

```
venv\Scripts\Activate.bat
```
or (for Linux/PI)
```
source venv\bin\activate
```

Install dependencies
```
pip3 install . --use-feature=in-tree-build
```

To launch the integration tests, use pytest:
```
pytest -p no:warnings
```

Run it
```
pypicar
```

Test it
```
curl  'http://localhost:8088/car/status'   -H 'accept: application/json'   -H 'X-API-KEY: hurruphenry'
{'name': 'picarname', 'status': 'READY'}
```

While you run it, this is how you can access the documentation/test 
and open your browser to here:

```
http://localhost:8088/ui/
```
