#!/usr/bin/env python

import os
import sys
from fnmatch import fnmatch


COMMAND = r"grep -l {pattern} {file}"
INFO = '{filename}: debugger found.'
PATTERNS = ['pdb.set_trace', 'import debug']


def check(repo, file, patterns):
    patterns = ['-e "{ptn}"'.format(ptn=pattern) for pattern in patterns]
    pattern = ' '.join(patterns)
    file = os.path.join(repo.root, file)
    return os.popen(COMMAND.format(pattern=pattern, file=file)).read()


def display_warning(lines):
    """ Display warning messages to sys.stderr """
    for line in lines:
        sys.stderr.write(INFO.format(filename=line.strip('\n')))


def _is_exists_pyfile(f, rl, dl):
    """Python file it is not a '!' or 'R' is the status of the mercurial
    """
    return fnmatch(f, '*.py') and f not in (rl + dl)


def get_pyfiles(repo, node):
    ctx = repo[node]
    rl = repo.status(ctx.parents()[0], ctx)[2]  # status: R: removed
    dl = repo.status(ctx.parents()[0], ctx)[3]  # statsu: !: deleted
    return [f for f in ctx.files() if _is_exists_pyfile(f, rl, dl)]


def check_pdb(ui, repo, hooktype, node=None, source=None, **kwargs):
    lines = [f for f in get_pyfiles(repo, node) if check(repo, f, PATTERNS)]
    if lines:
        display_warning(lines)
        sys.exit(1)
