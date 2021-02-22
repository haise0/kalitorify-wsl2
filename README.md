# Kalitorify on WSL2 using systemd and iptables-legacy

<p align="center">
<img src="kalitorify-wsl2-kali/logo.png" width="370"/> <img src="systemd-wsl2-kali/logo.png" width="410" hspace="30"/> 
</p>

## Summary 
I got annoyed at the incompatibility issues of WSL2, so I modified [brainfucksec's kalitorify](https://github.com/brainfucksec/kalitorify) to utilize iptables-legacy instead of the new/current iptables to avoid a bunch of iptables errors when using his script. I also modified [djfdyuruiry's method of using systemd on WSL2](https://gist.github.com/djfdyuruiry/6720faa3f9fc59bfdf6284ee1f41f950) to support the required systemctl commands in kalitorify, rather than using the WSL default sysvinit and `service` commands (I also fixed the corruption of the WSL distro thanks to the issue thread [here](https://github.com/openshift/origin/issues/15802)). For Ubuntu/Debian-based WSL2.  

Confirmed functional on kali-rolling for WSL2, kernel vesion 5.4.91.



## Installation
```
git clone https://github.com/haise0/kalitorify-wsl2/tree/main/kalitorify-wsl2-kali
cd kalitorify-wsl2
```

### Install kalitorify-wsl2
```
cd kalitorify-wsl2-kali
sudo make install
```

### Install systemd
```
cd systemd-wsl2-kali
sudo make install
```

### Reboot
Enter a powershell or cmd.exe window as Administrator and shutdown WSL to reboot:
```
wsl --shutdown
```
After that, go ahead and start kali (or your distribution of choice) back up again. 
Services and programs that use kalitorify (such as iptables-legacy) work at the kernel level. Rebooting WSL helps the operating system to avoid conflicts or leaks.

## Usage

* Note: For some reason the first time starting kalitorify-wsl2 may result in not being connected to tor. Use the --restart parameter and it should work right away and spit out your info.

**Before starting kalitorify-wsl2:**

1 - All of the commands remain the [same as the original kalitorify project]() for ease of access and familiarity.

2 - Please make sure you have read braindedsec's section about [Security](https://github.com/BrainfuckSec/kalitorify#security).

3 - Disable or make appropriate modifications to your firewall if is active.

4 - Make a backup of the iptables rules if they are present, see: [iptables](https://wiki.debian.org/iptables)

5 - See the original authors' documentations, and say thanks:
* [Braindedsec](https://github.com/brainfucksec)
* [djfdyuruiry](https://gist.github.com/djfdyuruiry)


## Support

Support me for the compatibility modifications (I really love coffee):
* [Cashapp](cash.app/$haise0)
* [Paypal.me](paypal.me/haise0)

Support brainfucksec for making the original kalitorify by making a donation to his Bitcoin address:

* `1B39SnAXcR2bkxNpNy3AuckgaTshqNc2ce`

Support djfdyuruiry by.. I don't know, I couldn't find anything. You should [ask him](https://gist.github.com/djfdyuruiry/6720faa3f9fc59bfdf6284ee1f41f950).
