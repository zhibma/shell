#!/bin/sh

# must be root
if [ 0 -ne $(/usr/bin/id -u) ]
then
    echo "Permission check failed, must be root." >&2
    exit 1
fi

# Login shell, whose the interpreter ran with a --login option,
# which will use ${HOME}/.bashrc to initial the environment.

# limit the interpreter specified by cmdline. As we know,
# the interpreter is specified by cmdline or script itself.
INTRPR=$(ps -o comm='' --pid ${$})
if [ ${INTRPR} != 'sh' -a ${INTRPR} != ${0##*/} ]
then
    echo "Error: ${INTRPR} is not the expected interpreter, use sh instead"
    exit ${VC_FALSE}
fi

# allow aliase expansion, when the interpreter is bash, disabled by default.
# However which is enabled when the interpreter is sh.
shopt -s expand_aliases
