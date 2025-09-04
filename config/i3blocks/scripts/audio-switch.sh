#!/bin/bash

# Script to automatically switch audio output when headphones are plugged in
# This monitors for USB headphone connections and switches PulseAudio/PipeWire output

HEADPHONE_SINK="alsa_output.usb-Razer_Razer_Kraken_V3_X_00000000-00.analog-stereo"
DEFAULT_SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"

# Function to switch to headphones
switch_to_headphones() {
    pactl set-default-sink "$HEADPHONE_SINK"
    # Move all currently playing streams to headphones
    pactl list short sink-inputs | while read stream; do
        streamId=$(echo "$stream" | cut -f1)
        pactl move-sink-input "$streamId" "$HEADPHONE_SINK" 2>/dev/null
    done
    notify-send "Audio Output" "Switched to headphones" -i audio-headphones
}

# Function to switch to speakers
switch_to_speakers() {
    pactl set-default-sink "$DEFAULT_SINK"
    # Move all currently playing streams to speakers
    pactl list short sink-inputs | while read stream; do
        streamId=$(echo "$stream" | cut -f1)
        pactl move-sink-input "$streamId" "$DEFAULT_SINK" 2>/dev/null
    done
    notify-send "Audio Output" "Switched to speakers" -i audio-speakers
}

# Check if headphones are connected
if pactl list sinks short | grep -q "$HEADPHONE_SINK"; then
    # Headphones are connected, check if they're the default
    current_default=$(pactl get-default-sink)
    if [ "$current_default" != "$HEADPHONE_SINK" ]; then
        switch_to_headphones
    fi
else
    # Headphones not connected, make sure speakers are default
    current_default=$(pactl get-default-sink)
    if [ "$current_default" != "$DEFAULT_SINK" ]; then
        switch_to_speakers
    fi
fi
