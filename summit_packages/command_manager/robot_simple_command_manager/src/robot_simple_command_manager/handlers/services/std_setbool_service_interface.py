#!/usr/bin/env python

from ..command_service_interface import *


class StdSetBoolServiceInterface(CommandServiceInterface):
    def __init__(self, name, parameters):
        self.args_description = ['value']
        self.args_types = [bool]
        self.args_void_allowed = [False]
        self.default_values = []
        self.default_values = []
        self.output_types = []
        self.output_description = []

        CommandServiceInterface.__init__(self, name, parameters)

    def set_parameters(self, parameters):
        '''
            Set all the required parameters of the interface
        '''
        CommandServiceInterface.set_parameters(self, parameters)

    def build_msg(self, args):
        '''
            Return the desired goal or None
        '''

        if type(args) == list:
            self.request.data = args[0]


    def parse_feedback(self):
        '''
            Parse from feedback object to string
        '''
        return self.feedback_msg.message
    
    def has_succeeded(self):
        return self.feedback_msg.success
