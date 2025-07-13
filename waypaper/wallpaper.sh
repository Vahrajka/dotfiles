#!/usr/bin/env bash

sleep 1

WALLPAPER=$(swww query | head -n1 | awk '{print $8}')

wal -i $WALLPAPER
wal-cache
