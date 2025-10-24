# AGENTS.md

This file provides a high-level overview of the Klipper configuration for this printer and instructions for future agents.

## Configuration Structure

The Klipper configuration is located in the `printer_data/config` directory. It is organized into a modular structure to improve clarity and maintainability.

The main configuration file is `printer.cfg`. This file includes all the other configuration files.

The configuration modules are located in the `printer_data/config/modules` directory. Each module contains the configuration for a specific component of the printer.

The following modules are available:

- `steppers.cfg`: Stepper motor configurations
- `fans.cfg`: Fan configurations
- `sensors.cfg`: Sensor configurations
- `extruder.cfg`: Extruder configurations
- `heater_bed.cfg`: Heated bed configurations
- `gantry.cfg`: Gantry and skew correction configurations
- `probe.cfg`: Probe configurations

## Modifying the Configuration

To modify the configuration, edit the appropriate module file. Do not edit `printer.cfg` directly, unless you are adding or removing a module.

Before making any changes, please read the comments in the configuration files to understand the parameters.

After making any changes, please run the `klipper_config_validator.sh` script to check for common configuration errors.
