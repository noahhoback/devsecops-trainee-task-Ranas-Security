#!/usr/bin/env python3
import os
import getpass

print(f"Current user: {getpass.getuser()}")
print(f"Working directory: {os.getcwd()}")
print(f"APP_ENV: {os.environ.get('APP_ENV', 'default')}")
