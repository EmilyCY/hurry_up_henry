# coding: utf-8

import sys
from setuptools import setup, find_packages

NAME = "pypicar"
VERSION = "0.0.1"

# To install the library, run the following
#
# python setup.py install
#
# prerequisite: setuptools
# http://pypi.python.org/pypi/setuptools

REQUIRES = [
    "connexion==2.6.0",
    "swagger-ui-bundle==0.0.6",
    "aiohttp_jinja2==1.2.0",
]

setup(
    name=NAME,
    version=VERSION,
    description="Hurry up Henry",
    author_email="103320303@student.swin.edu.au",
    url="",
    keywords=["OpenAPI", "Hurry up Henry"],
    install_requires=REQUIRES,
    packages=find_packages("src\"),
    package_dir={"": "src\"},
    package_data={'': ['src\/openapi/openapi.yaml']},
    include_package_data=True,
    entry_points={
        'console_scripts': ['pypicar=pypicar.__main__:main']},
    long_description="""\
    This is a an API definition for the Hurry Up Henry backend integration
    """
)

