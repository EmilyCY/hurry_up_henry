# coding: utf-8

from datetime import date, datetime

from typing import List, Dict, Type

from pypicar.api.models.base_model_ import Model
from pypicar.api import util


class Rotate(Model):
    """NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).

    Do not edit the class manually.
    """

    def __init__(self, clockwise: bool=True):
        """Rotate - a model defined in OpenAPI

        :param clockwise: The clockwise of this Rotate.
        """
        self.openapi_types = {
            'clockwise': bool
        }

        self.attribute_map = {
            'clockwise': 'clockwise'
        }

        self._clockwise = clockwise

    @classmethod
    def from_dict(cls, dikt: dict) -> 'Rotate':
        """Returns the dict as a model

        :param dikt: A dict.
        :return: The Rotate of this Rotate.
        """
        return util.deserialize_model(dikt, cls)

    @property
    def clockwise(self):
        """Gets the clockwise of this Rotate.

        Rotate clockwise (true) or anti-clockwise (false)

        :return: The clockwise of this Rotate.
        :rtype: bool
        """
        return self._clockwise

    @clockwise.setter
    def clockwise(self, clockwise):
        """Sets the clockwise of this Rotate.

        Rotate clockwise (true) or anti-clockwise (false)

        :param clockwise: The clockwise of this Rotate.
        :type clockwise: bool
        """
        if clockwise is None:
            raise ValueError("Invalid value for `clockwise`, must not be `None`")

        self._clockwise = clockwise
