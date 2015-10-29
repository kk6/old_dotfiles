#!/usr/bin/env python

import sys


def warning(ui, repo, hooktype, node=None, source=None, **kwargs):
    ctx = repo[None]
    unknown_files = repo.status(ctx.parents()[0], ctx, unknown=True)[4]
    if unknown_files:
        sys.stderr.write("Warning: unmanaged files found.\n"
                         "Anyway you want it. That's the way you need it.\n")
        for filename in unknown_files:
            sys.stderr.write('{filename}\n'.format(filename=filename))
