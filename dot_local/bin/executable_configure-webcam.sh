#!/bin/env bash

set -x

v4l2-ctl --list-devices | grep -q video0 && v4l2-ctl -d /dev/video0 --set-ctrl power_line_frequency=1 || exit 0
