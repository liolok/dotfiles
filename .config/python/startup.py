# PYTHONSTARTUP=$XDG_CONFIG_HOME/python/startup.py

# Customize history file location to support XDG base directory
# (https://docs.python.org/3/library/pathlib.html)
# (https://docs.python.org/3/library/readline.html?#history-file)
# (https://docs.python.org/3/library/readline.html?#example)
from os import getenv
from pathlib import Path
import atexit
import readline

hist_file = Path(getenv('XDG_DATA_HOME', '~/.local/share')).expanduser() / 'python/history'

try:
    readline.read_history_file(hist_file) # read previous history from file
    hist_old_len = readline.get_current_history_length() # get old history length
except FileNotFoundError: # history file not exist yet
    hist_file.parent.mkdir(parents=True, exist_ok=True) # create base directory
    hist_file.touch() # create empty file
    # add fake history to avoid force default file location, dirty but works :(
    # see more in `register_readline()` of /usr/lib/python3.8/site.py:L431
    # upstream issue: https://bugs.python.org/issue5845#msg198636
    readline.add_history('print("Hello, world.")') # won't be written to file, only in session
    hist_old_len = 1

def save_history(previous_length, hist_file):
    current_length = readline.get_current_history_length()
    length = current_length - previous_length
    readline.append_history_file(length, hist_file) # only append new history of this session

atexit.register(save_history, hist_old_len, hist_file) # when exit interactive sessions
