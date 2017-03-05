#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 10
/bin/echo -n .
$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set remap.japanese_command2eisuukana_prefer_command_v2 1
/bin/echo -n .
/bin/echo
