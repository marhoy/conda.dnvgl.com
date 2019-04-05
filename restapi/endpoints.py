import subprocess


def conda_index():
    output = subprocess.run("conda index /condarepo/stable", capture_output=True, shell=True)

    return "StdErr:\n{}\n\nStdOut:\n{}".format(output.stderr, output.stdout)
