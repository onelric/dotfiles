#!/bin/sh

# Get total and free memory in kilobytes
mem_total_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_free_kb=$(grep MemFree /proc/meminfo | awk '{print $2}')
buffers_kb=$(grep Buffers /proc/meminfo | awk '{print $2}')
cached_kb=$(grep ^Cached /proc/meminfo | awk '{print $2}')

# Calculate used memory in kilobytes
mem_used_kb=$((mem_total_kb - mem_free_kb - buffers_kb - cached_kb))

# Convert kilobytes to gigabytes
mem_total_gb=$(echo "scale=2; $mem_total_kb/1024/1024" | bc)
mem_used_gb=$(echo "scale=2; $mem_used_kb/1024/1024" | bc)

# Echo the result
echo "$mem_used_gb GB / $mem_total_gb GB"

