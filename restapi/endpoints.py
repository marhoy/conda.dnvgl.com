import os


def conda_index() -> str:
    output = os.popen("dir").read()
    return output
