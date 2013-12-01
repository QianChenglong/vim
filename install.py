#! /usr/bin/env python2
# coding=utf-8

import platform
import os

if platform.system() == "Windows":
        home = os.environ.get("USERPROFILE")
        cmd = "cp " + "E:\\Vim\\Setting\\_vimrc" + home + "\_vimrc"
        print cmd
        os.system(cmd)
else:
    os.system("cp  -v /data/Vim/Setting/_vimrc ~/.vimrc")
    os.system("ln -vs /data/Vim/Setting/.vim ~")
