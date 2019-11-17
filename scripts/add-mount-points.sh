#!/bin/sh

test -f /mnt/storage || mkdir /mnt/storage
test -f /mnt/small || mkdir /mnt/small
test -f /mnt/big || mkdir /mnt/big

mount /dev/sda1 /mnt/storage
mount /dev/sdc2 /mnt/small
mount /dev/sdc3 /mnt/big

rm /tmp/my-fstab
genfstab -U /mnt/storage >> /tmp/my-fstab
genfstab -U /mnt/small >> /tmp/my-fstab
genfstab -U /mnt/big >> /tmp/my-fstab

cat /tmp/my-fstab >> /etc/fstab
