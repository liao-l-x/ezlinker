#!/bin/sh
/emqx/bin/emqx start > /log
tail -f /dev/null