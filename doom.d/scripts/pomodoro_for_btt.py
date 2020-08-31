import subprocess
import sys

p = None
try:
    p = subprocess.check_output(["/usr/local/bin/emacsclient", "-e", "(my/org-pomodoro-text-time)"], timeout=0.3)
    p = p.decode("UTF-8")
    with open("/tmp/btt-org-pomodoro.tmp", "w") as f:
        f.write(p)
except:
    with open("/tmp/btt-org-pomodoro.tmp", "r") as f:
        p = f.readline()


p = p.strip().strip('"').split("∂")
if len(p) == 0:
    print("ERROR: EMPTY OUTPUT")
if p[0] == "Clock":
    if len(p) != 3:
        print("unexpected clock: {}".format(p))
        sys.exit()
    print("[{} min]: {}".format(p[1], p[2]))
elif p[0] == "Pomodoro":
    if len(p) != 4:
        print("unexpected pomodoro: {}".format(p))
        sys.exit()
    sec, min = int(p[2]) // 60, int(p[2]) % 60
    print("#{} [{:02d}:{:02d}] {}".format(int(p[1])+1, sec, min, p[3]))
elif p[0] == "Short":
    print("Short Break:")
elif p[0] == "Long":
    print("Long Break:")
elif p[0] == "None":
    print("No timer running")
else:
    print("ERROR: UNEXPECTED OUTPUT: {}".format(p[0]))
