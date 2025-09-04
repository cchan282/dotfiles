#!/bin/bash

# Optimized brightness control script for external monitors via ddcutil
# Uses caching and rate limiting to prevent system slowdown

CACHE_FILE="/tmp/brightness_cache"
LOCK_FILE="/tmp/brightness_lock"
MAX_BRIGHTNESS=100
MIN_BRIGHTNESS=1
STEP=10

# Function to get current brightness (cached)
get_brightness() {
    if [[ -f "$CACHE_FILE" ]] && [[ $(($(date +%s) - $(stat -c %Y "$CACHE_FILE"))) -lt 2 ]]; then
        # Use cached value if less than 2 seconds old
        cat "$CACHE_FILE"
    else
        # Get actual value and cache it
        local brightness=$(ddcutil getvcp 10 2>/dev/null | grep -o "current value = *[0-9]*" | grep -o "[0-9]*")
        if [[ -n "$brightness" ]]; then
            echo "$brightness" > "$CACHE_FILE"
            echo "$brightness"
        else
            echo "50"  # Default fallback
        fi
    fi
}

# Function to set brightness
set_brightness() {
    local new_value="$1"
    
    # Rate limiting - prevent multiple simultaneous calls
    if [[ -f "$LOCK_FILE" ]]; then
        local lock_age=$(($(date +%s) - $(stat -c %Y "$LOCK_FILE")))
        if [[ $lock_age -lt 1 ]]; then
            # Skip if recent operation is still in progress
            exit 0
        fi
    fi
    
    # Create lock file
    touch "$LOCK_FILE"
    
    # Execute ddcutil in background and clean up
    {
        ddcutil setvcp 10 "$new_value" 2>/dev/null
        # Update cache with new value
        echo "$new_value" > "$CACHE_FILE"
        # Remove lock file
        rm -f "$LOCK_FILE"
        # Optional: Show notification instead of blocking status bar
        if command -v notify-send >/dev/null 2>&1; then
            notify-send -t 1000 "Brightness" "Set to ${new_value}%" -h int:value:"$new_value"
        fi
    } &
    
    # Don't wait for background process
    disown
}

# Main logic
case "$1" in
    "up")
        current=$(get_brightness)
        new_value=$((current + STEP))
        [[ $new_value -gt $MAX_BRIGHTNESS ]] && new_value=$MAX_BRIGHTNESS
        set_brightness "$new_value"
        ;;
    "down")
        current=$(get_brightness)
        new_value=$((current - STEP))
        [[ $new_value -lt $MIN_BRIGHTNESS ]] && new_value=$MIN_BRIGHTNESS
        set_brightness "$new_value"
        ;;
    "get")
        get_brightness
        ;;
    *)
        echo "Usage: $0 {up|down|get}"
        exit 1
        ;;
esac
