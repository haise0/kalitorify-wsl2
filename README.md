# Kalitorify on WSL2 using systemd and iptables-legacy


<img src="systemd-wsl2-kali/logo.png" width="440" hspace="10"/> <img src="kalitorify-wsl2-kali/logo.png" width="410"/> 


## Summary 
I got annoyed at the incompatibility issues of WSL2, so I modified [brainfucksec](https://github.com/brainfucksec/)'s kalitorify to utilize iptables-legacy to avoid a bunch of iptables errors when using his script, and modified [djfdyuruiry](https://gist.github.com/djfdyuruiry/6720faa3f9fc59bfdf6284ee1f41f950)'s method of enabling systemd to support the required systemctl commands in kalitorify, rather than using the WSL default sysvinit and `service` commands, for Ubuntu/Debian-based WSL2 - also fixed to prevent corrupting the distribution from the script on his main branch. 

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
```
1B39SnAXcR2bkxNpNy3AuckgaTshqNc2ce
```
Support djfdyuruiry by.. I don't know, I couldn't find anything. You should [ask him](https://gist.github.com/djfdyuruiry/6720faa3f9fc59bfdf6284ee1f41f950).
