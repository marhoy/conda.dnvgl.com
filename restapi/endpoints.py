import subprocess


def conda_index():
    output = subprocess.run("conda index /condarepo/stable", capture_output=True, shell=True)
    return_string = "StdErr:\n" +  output.stderr.decode('UTF-8') \
                    + "\n\nStdOut:\n" + output.stdout.decode('UTF-8')
    return return_string
