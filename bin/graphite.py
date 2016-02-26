#! /usr/bin/env python
import os

os.environ.setdefault('DEBUG', '3')

import graphite_api

graphite_api.DEBUG = bool(int(os.environ['DEBUG']))

from graphite_api.app import app


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8888))
    host = os.environ.get('BIND_ADDRESS', '127.0.0.1')
    app.run(debug=graphite_api.DEBUG, port=port, host=host)
