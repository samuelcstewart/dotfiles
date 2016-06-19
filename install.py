#!/usr/bin/env python
# Simple python installation script for dotfiles.
# Symlinks files with a *.symlink extension to the home directory, more later.

import os
import re

regex = re.compile(r'^(.*?)(.symlink)$')
path = os.path.dirname(os.path.realpath(__file__))
home = os.path.expanduser('~')

for subdir, dirs, files in os.walk(path):
    for file in files:
        match = regex.search(file)
        if match:
            src = os.path.join(subdir, file)
            dest = os.path.join(home, '.' + match.group(1))
            if os.path.isfile(dest):
              os.rename(dest, dest + '.bak')
            os.symlink(src, dest)
            print(dest + ' -> ' + src)
