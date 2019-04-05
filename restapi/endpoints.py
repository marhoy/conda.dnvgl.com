import os


def conda_index():
    output = os.popen("conda index /condarepo/stable").read()
    return output
