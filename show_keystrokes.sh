#!/bin/bash

sudo evtest --grab /dev/input/event3 | awk -F ' ' '/^Event: / && /EV_KEY/ { getline; print $NF }'

