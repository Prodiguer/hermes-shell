# -*- coding: utf-8 -*-

"""
.. module:: run_in_monitoring_2000.py
   :copyright: Copyright "Apr 26, 2013", Institute Pierre Simon Laplace
   :license: GPL/CeCIL
   :platform: Unix
   :synopsis: Consumes monitoring 2000 messages.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>


"""
from prodiguer import cv
from prodiguer import mq

import in_monitoring_job_start as base



class ProcessingContextInfo(base.ProcessingContextInfo):
    """Message processing context information.

    """
    def __init__(self, props, body, decode=True):
        """Object constructor.

        """
        super(ProcessingContextInfo, self).__init__(
            props, body, decode=decode)

        self.job_type = cv.constants.JOB_TYPE_POST_PROCESSING

