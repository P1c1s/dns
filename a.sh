#!/bin/bash

#Pornographic Site

host -t a pornhub.com >> blacklist
echo "" > file
cat blacklist | cut -d' ' -f4 >> file
