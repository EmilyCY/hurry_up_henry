# PYthon PI car backend server for Hurry up Henry

## Overview


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
pip3 install .
```

and open your browser to here:

```
http://localhost:8088/ui/
```

Your OpenAPI definition lives here:

```
http://localhost:8088/openapi.json
```

To launch the integration tests, use pytest:
```
pytest
```
