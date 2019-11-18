#!/bin/sh

################################################################
# Install a printer on Arch Linux with cups using command line #
# Used for a HP P1102w					       #
################################################################

# Created based on an article:
# https://gist.github.com/edoz90/660a2a67b9bc8a815ba537530137636a

# Set printer name
PRINTER_NAME=HP_P1102w

# Install cups if not installed
pacman -Q cups 1>>/dev/null || pacman -S cups

# Enable cups service
#systemctl enable org.cups.cupsd

# Start cups service
#systemctl start org.cups.cupsd

# Check if HP is connected as usb device. If not print error and exit
lsusb | grep 'HP, Inc LaserJet Professional P 1102w' 1>>/dev/null || (echo "HP P 1102w not found. Exiting..." && exit)

# Find printer URI
PRINTER_URI=$(lpinfo -v | grep HP | awk '{ print $2}')

echo "Printer URI: $PRINTER_URI"

# Find printf driver
PRINTER_DRIVER=$(lpinfo -m | grep lsb.*1102w | awk '{print $1}')
echo "Printer driver: $PRINTER_DRIVER"

exit
# Create a print quue with URI and driver
sudo lpadmin -p $PRINTER_NAME -E -v "$PRINTER_URI" -m $PRINTER_DRIVER

# Set as default
lpoptions -d $PRINTER_NAME

# Set A4 page
lpoptions -p $PRINTER_NAME -o PageSize=A4

# Enable printing
sudo cupsenable $PRINTER_NAME
sudo cupsaccept $PRINTER_NAME

# Restart cups service
sudo systemclt restart org.cups.cupsd

