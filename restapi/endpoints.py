import subprocess


def conda_index():
    output = subprocess.run("conda index /condarepo/stable", capture_output=True, shell=True)
    return_string = "StdErr:\n{}\n\nStdOut:\n{}".format(
        output.stderr.decode('UTF.8'),
        output.stdout.decode('UTF-8'))
    return return_string
