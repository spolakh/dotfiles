import subprocess
import json
import sys

violet = "108,33,133,255"
yellow = "255,224,97,255"
red = "255,96,94,255"
green = "156,226,90,255"

p = None
try:
    p = subprocess.check_output(["/usr/local/bin/emacsclient", "-e", "(my/org-pomodoro-text-time)"], timeout=0.3)
    p = p.decode("UTF-8")
    with open("/tmp/btt-org-pomodoro.tmp", "w") as f:
        f.write(p)
except:
    with open("/tmp/btt-org-pomodoro.tmp", "r") as f:
        p = f.readline()

def parse(inp):
    p = inp.strip().strip('"').split("¥")

    if len(p) == 0:
        return "ERROR: EMPTY OUTPUT", yellow, green
    elif p[0] == "Clock":
        if len(p) != 3:
            return "unexpected clock: {}".format(p), yellow, green
        return "[{} min]: {}".format(p[1], p[2]), red, yellow
    elif p[0] == "Pomodoro":
        if len(p) != 4:
            return "unexpected pomodoro: {}".format(p), yellow, green
        sec, min = int(p[2]) // 60, int(p[2]) % 60
        return "#{} [{:02d}:{:02d}] {}".format(int(p[1])+1, sec, min, p[3]), red, yellow
    elif p[0] == "Short":
        return "Short Break", green, violet
    elif p[0] == "Long":
        return "Long Break", green, violet
    elif p[0] == "None":
        return "No timer running", yellow, red
    else:
        return "ERROR: UNEXPECTED OUTPUT: {}".format(p[0]), yellow, green

text, bgcolor, fncolor = parse(p)
result = {
    "text": text,
    "background_color": bgcolor,
    "font_color": fncolor
}
print(json.dumps(result))
