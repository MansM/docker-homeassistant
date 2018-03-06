import os
import importlib
import sys
import pprint
import homeassistant.components
import pip

modules = []
for module in open('/modules.txt'):
    modules.append(module.strip())



for x in modules:
  modname =  'homeassistant.components.' + x
  importlib.import_module(modname)
  if hasattr(eval(modname), 'REQUIREMENTS' ):
    REQNAME = modname + ".REQUIREMENTS"
    for y in eval(REQNAME):
        pip.main(['install', y, '--constraint', '/usr/local/lib/python3.5/dist-packages/homeassistant/package_constraints.txt'])
        print(y)