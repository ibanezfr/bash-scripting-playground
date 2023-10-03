#!/bin/bash

## NOT GOOD >>
cp /my/location/from /my/location/to
cp /my/location/from/here /my/location/to/there

## BETTER >>
LOC_FROM=/my/lacation/from
LOC_TO=/my/location/to

cp $LOC_FROM $LOC_TO

cp "$LOC_FROM/here" "$LOC_TO/there"

