#!/bin/bash

if [ -n "$(ls /dev/video* 2>/dev/null)" ]; then
  set -x
  chmod -v a+rw /dev/video*
  { set +ex; } 2>/dev/null
fi

if [ -n "$(ls /dev/media* 2>/dev/null)" ]; then
  set -x
  chmod -v a+rw /dev/media*
  { set +ex; } 2>/dev/null
fi

if [ -n "$(ls /dev/dri/* 2>/dev/null)" ]; then
  set -x
  chmod -v a+rw /dev/dri/*
  { set +ex; } 2>/dev/null
fi
