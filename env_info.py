#!/usr/bin/env python3
import os
import getpass

def main() -> None:
    """
    Prints:
      - current user name
      - current working directory
      - value of APP_ENV environment variable (or 'default' if not set)
    """
    user = getpass.getuser()
    cwd = os.getcwd()
    app_env = os.environ.get("APP_ENV", "default")

    print(f"Current user: {user}")
    print(f"Current working directory: {cwd}")
    print(f"APP_ENV: {app_env}")

if __name__ == "__main__":
    main()
