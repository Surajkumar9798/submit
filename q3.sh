#!/bin/bash

read -p "Enter the length of the password: " length
pwgen -1 "$length"
