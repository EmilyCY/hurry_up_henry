# coding: utf-8

import sys
from setuptools import setup, find_namespace_packages

NAME = "pypicar"
VERSION = "0.0.1"

REQUIRES = [
    "connexion",
    "swagger-ui-bundle",
    "aiohttp_jinja2",
    "aiohttp_cors",
    "wheel",
    "click<=7.1.2",

    "pytest",
    "pytest-cov",
    "pytest-randomly",
    "pytest-aiohttp>=0.3.0"
]

setup(
    name=NAME,
    version=VERSION,
    description="Hurry up Henry",
    author_email="103320303@student.swin.edu.au",
    url="",
    keywords=["OpenAPI", "Hurry up Henry"],
    install_requires=REQUIRES,
    package_dir={"": "src"},
    package_data={'': ['api/openapi/openapi.yaml']},
    packages=find_namespace_packages(where='src'),
    include_package_data=True,
    entry_points={
        'console_scripts': ['pypicar=pypicar:main']},
    long_description="""\
    Hurry Up Henry backend integration
    """
)

