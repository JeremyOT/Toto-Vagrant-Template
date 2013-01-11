#!/usr/bin/env python

import toto.server
import os

if __name__ == "__main__":
  toto.server.TotoServer(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'server.conf')).run()
