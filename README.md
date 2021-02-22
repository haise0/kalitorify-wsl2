# Kalitorify on WSL2 using systemd and iptables-legacy

## Summary 
I got annoyed at the incompatibility issues of WSL2, so I modified [brainfucksec](https://github.com/brainfucksec/)'s kalitorify to utilize iptables-legacy to avoid a bunch of iptables errors when using his script, and modified [djfdyuruiry](https://gist.github.com/djfdyuruiry/6720faa3f9fc59bfdf6284ee1f41f950)'s method of enabling systemd to support systemctl commands, rather than the WSL default sysvinit, for Ubuntu/Debian-based WSL2 - also fixed to prevent corrupting the distribution from the script on his main branch. 

Confirmed functional on kali-rolling for WSL2, kernel vesion 5.4.91.



## Installation
```
git clone https://github.com/haise0/kalitorify-wsl2/tree/main/kalitorify-wsl2-kali
cd kalitorify-wsl2
```

### kalitorify-wsl2
```
cd kalitorify-wsl2-kali
sudo make install
```

### systemd
```
cd systemd-wsl2-kali
sudo make install
```

### After kalitorify-wsl2 and systemd are installed
Enter a powershell or cmd.exe window as Administrator and shutdown WSL:
```
wsl --shutdown
```
After that, go ahead and start kali (or your distribution of choice) back up again. 

## Usage

* Note: For some reason the first time starting kalitorify-wsl2 may result in not being connected to tor. Use the --restart parameter and it should work right away and spit out your info.

**Before starting kalitorify-wsl2:**

1 - All of the commands remain the same as the original kalitorify project for ease of access and familiarity.

2 - Please make sure you have read braindedsec's section about [Security](https://github.com/BrainfuckSec/kalitorify#security).

3 - Disable or make appropriate modifications to your firewall if is active.

4 - Make a backup of the iptables rules if they are present, see: [iptables](https://wiki.debian.org/iptables)

5 - Pay the original authors a visit and say thanks:
* [Braindedsec]
* [djfdyuruiry]


## Support

Support me for the compatibility modifications (I really love coffee):
* [Cashapp](cash.app/$haise0)
* [Paypal.me](paypal.me/haise0)

Support brainfucksec for making the original kalitorify by making a donation to his Bitcoin address:
```
1B39SnAXcR2bkxNpNy3AuckgaTshqNc2ce
```
Support djfdyuruiry by.. I don't know, I couldn't find anything. You should [ask him](https://gist.github.com/djfdyuruiry/6720faa3f9fc59bfdf6284ee1f41f950).
