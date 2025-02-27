import os
import subprocess
import time

# List of programs to restart
programs = [
    "solaar -w hide",
    "sxhkd -c $XDG_CONFIG_HOME/awesome/sxhkdrc",
    "picom -c $XDG_CONFIG_HOME/awesome/picom.conf",
    "lxpolkit",
    "greenclip daemon",
    "xautolock -time 15 -locker locker",
]


def get_process_name(command):
    """Extract the process name from the command"""
    return command.split()[0]


def kill_programs():
    """Kill all listed programs"""
    for cmd in programs:
        proc_name = get_process_name(cmd)
        try:
            subprocess.run(["killall", "-q", proc_name], check=True)
        except subprocess.CalledProcessError:
            pass  # Ignore if process is not running


def start_programs():
    """Start all programs"""
    for cmd in programs:
        proc_name = get_process_name(cmd)
        if (
            subprocess.run(
                ["which", proc_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE
            ).returncode
            == 0
        ):
            subprocess.Popen(cmd, shell=True)
        else:
            print(f"Warning: {proc_name} not found!")


if __name__ == "__main__":
    kill_programs()
    time.sleep(1)  # Short delay to ensure processes are fully terminated
    start_programs()
