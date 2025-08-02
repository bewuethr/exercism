#!/usr/bin/env bash

str=$1
for ((i = ${#str} - 1; i >= 0; --i)); do
    res+=${str:i:1}
done

echo "$res"