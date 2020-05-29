# PYTHONSTARTUP=$XDG_CONFIG_HOME/python/startup.py
# (https://docs.python.org/3/library/readline.html?#example)
# (https://bugs.python.org/msg318437)
import atexit
import os
import readline

if 'PYTHONHISTFILE' in os.environ:
    histfile = os.path.expanduser(os.environ['PYTHONHISTFILE'])
elif 'XDG_DATA_HOME' in os.environ:
    histfile = os.path.join(os.path.expanduser(os.environ['XDG_DATA_HOME']),
                            'python', 'history')
else:
    histfile = os.path.join(os.path.expanduser('~'), '.local', 'share',
                            'python', 'history')

try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(1000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)
