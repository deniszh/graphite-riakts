#!/bin/bash

pip install virtualenv
virtualenv env
pip install https://github.com/graphite-project/carbon/archive/master.zip --install-option="--prefix=$(pwd)/var/graphite" --install-option="--install-lib=$(pwd)/var/graphite/lib"
pip install riak
