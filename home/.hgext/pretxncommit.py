#!/usr/bin/env python
import os
import re
import subprocess
import sys
 
cmd = subprocess.Popen(['hg', 'log', '-vr', os.environ['HG_NODE']],
                       stdout=subprocess.PIPE).communicate()[0]
msg = cmd.split('description:')[1]
issue_regexes = [
    # Trac
    r'#\d+',
    # Redmine
    r'fixes #\d+',
    r'refs #\d+',
    ]
if not filter(lambda x: re.search(x, msg), issue_regexes):
    print "No issue ref or fix... message is:"
    print msg
    sys.stdout.write("Continue? [y/n] ")
    resp = raw_input().lower()
    if resp == 'n':
        sys.exit(9)
