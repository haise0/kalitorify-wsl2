# Kalitorify on WSL2 using systemd and iptables-legacy

## Summary 
  I got annoyed at the incompatibility issues of WSL2, so I modified [brainfucksec](https://github.com/brainfucksec/)'s kalitorify to utilize iptables-legacy to avoid a bunch of iptables errors when using his script, and modified [djfdyuruiry](https://gist.github.com/djfdyuruiry/6720faa3f9fc59bfdf6284ee1f41f950)'s method of enabling systemd rather than sysvinit for Ubuntu/Debian-based WSL2 to prevent corrupting the distribution. 
Confirmed functional on kali-rolling for WSL2, kernel vesion 5.4.91.



## Installation

### kalitorify-wsl2

```git clone https://github.com/haise0/kalitorify-wsl2/tree/main/kalitorify-wsl2-kali
cd kalitorify-wsl2
```

### systemd




## Usage

**Before starting kalitorify-wsl2:**

0 - All of the commands remain the same as the original project for ease of access.

1 - Make sure you have read the section about [Security](#security).

2 - Disable your firewall if is active.

3 - Make a backup of the iptables rules if they are present, see: [iptables](https://wiki.debian.org/iptables)


## Donate

Support me for the compatibility modifications:
* [Cashapp](cash.app/$haise0)
* [Paypal.me](paypal.me/haise0)

Support brainfucksec for making the original kalitorify by making a donation to his Bitcoin address:

```
1B39SnAXcR2bkxNpNy3AuckgaTshqNc2ce
```

