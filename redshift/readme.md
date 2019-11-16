# Installation

sudo pacman -S redshift

# Enable access to geoclue

vim /etc/geoclue/geoclue.conf

[redshift]
allowed=true
system=false
users=

# Restart geoclue

systemctl restart geoclue

# Configure Redshift

mkdir -p ~/.config/redshift
vim ~/.config/redshift/redshift.conf

[redshift]
location-provider=geoclue2
