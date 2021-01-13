#!/usr/bin/python3.9
# -*- coding: utf-8 -*-


myfile = open("lorem.txt", "rt") # open lorem.txt for reading text
contents = myfile.read()         # read the entire file to string
myfile.close()                   # close the file
print(contents)                  # print string contents
