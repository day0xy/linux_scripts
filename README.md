# simple_linux_scripts







### touchpad.sh
for x11

install `xorg-xinput`  ,  `xf86-input-libinput`
```
x11, automatically turns off the touchpad. You can add it as a startup item and bind shortcut keys to switch the touchpad state.
```

### hibernator
for enable hibernate on linux


filesystem `except` btrfs

```
sudo cp /etc/fstab /etc/fstab.backup
sudo cp /etc/default/grub /etc/default/grub.backup
sudo dd if=/dev/zero of=/swapfile bs=1M count=30720
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none    swap    defaults 0 0' | sudo tee -a /etc/fstab

yay -S update-grub
chmod +x hibernator
sudo ./hibernator


sudo grub-mkconfig -o /boot/grub/grub.cfg

```

`btrfs`
```
btrfs filesystem mkswapfile --size 30G /swapfile
swapon /swapfile

echo '/swapfile none    swap    defaults 0 0' | sudo tee -a /etc/fstab

chmod +x hibernator
sudo ./hibernator


sudo grub-mkconfig -o /boot/grub/grub.cfg
```




