#!/usr/bin/env bash

input=$1

if [[ $input == "total" ]]; then
	bc -l <<< "2^64-1"
	exit 0
fi

if ((input < 1 || input > 64)); then
	echo "Error: invalid input" >&2
	exit 1
fi

bc -l <<< "2^($input-1)"
