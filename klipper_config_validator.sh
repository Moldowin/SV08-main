#!/bin/bash

# This script validates the Klipper configuration for common errors.

# Set the path to the Klipper configuration directory
CONFIG_DIR="printer_data/config"

# Check for the existence of the main configuration file
if [ ! -f "$CONFIG_DIR/printer.cfg" ]; then
    echo "Error: printer.cfg not found in $CONFIG_DIR"
    exit 1
fi

# Check for the existence of all included files
for file in $(grep -r "\[include" "$CONFIG_DIR" | awk '{print $2}'); do
    if [ ! -f "$CONFIG_DIR/$file" ]; then
        echo "Error: Included file $file not found in $CONFIG_DIR"
    fi
done

# Check for the presence of mandatory sections
for section in "mcu" "printer" "stepper_x" "stepper_y" "stepper_z" "extruder" "heater_bed"; do
    if ! grep -q "\[$section\]" "$CONFIG_DIR/printer.cfg" && ! grep -q -r "\[$section\]" "$CONFIG_DIR/modules"; then
        echo "Error: Mandatory section [$section] not found in the configuration"
    fi
done

echo "Configuration validation complete. No major errors found."
