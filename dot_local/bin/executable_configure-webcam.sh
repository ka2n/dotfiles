#!/bin/env bash

set -x

v4l2-ctl --list-devices | grep -q video0 \
    && v4l2-ctl -d /dev/video0 \
        -c power_line_frequency=1 \
        -c auto_exposure=1 \
        -c exposure_time_absolute=200 \
    || exit 0
