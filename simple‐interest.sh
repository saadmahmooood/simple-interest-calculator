#!/usr/bin/env bash
#
# simple-interest.sh
# A script to calculate simple interest given principal, rate, and time.

# Check for exactly 3 arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <PRINCIPAL> <RATE> <TIME>"
  echo "Example: $0 1000 5 2"
  exit 1
fi

# Assign positional parameters
principal="$1"
rate="$2"
time="$3"

# Validate numeric input (optional but recommended)
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $principal =~ $re && $rate =~ $re && $time =~ $re ]]; then
  echo "Error: All inputs must be numeric."
  exit 1
fi

# Calculate simple interest: SI = (P * R * T) / 100
si=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

echo "Simple Interest is: $si"
