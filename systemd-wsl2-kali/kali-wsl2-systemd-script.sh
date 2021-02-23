#!/bin/bash

if [ "$1" != "--force" ]; then
    if [ -f /usr/sbin/start-systemd-namespace ]; then
        echo "It looks like you've already installed systemd."
        echo "If you're having issues, you can forcibly reinstall by running this script with the \`--force\` parameter."
        exit
    fi
    if [ -z "$WSL_DISTRO_NAME" ]; then
        echo "Couldn't get a distro name. Are you sure you're running on a WSL distro?"
        echo "If not, but you want to do this anyways, you can forcibly install by running this script with the \`--force\` parameter."
	echo "If you are on WSL, but you're seeing this message, it is recommended you double check everything to be safe."
        exit
    fi
fi

self_dir="$(dirname $0)"

function interop_prefix {
	win_location="/mnt/"
	if [ -f /etc/wsl.conf ]; then
		tmp="$(awk -F '=' '/root/ {print $2}' /etc/wsl.conf | awk '{$1=$1;print}')"
		[ "$tmp" == "" ] || win_location="$tmp"
		unset tmp
	fi
	echo "$win_location"

	unset win_location
}

function sysdrive_prefix {
	win_location="$(interop_prefix)"
	hard_reset=0
	for pt in $(ls "$win_location"); do
		if [ $(echo "$pt" | wc -l) -eq 1 ]; then
			if [ -d "$win_location$pt/Windows/System32" ]; then
				hard_reset=1
				win_location="$pt"
				break
			fi
		fi 
	done

	if [ $hard_reset -eq 0 ]; then
		win_location="c"
	fi

	echo "$win_location"

	unset win_location
	unset hard_reset
}

sudo hwclock -s
sudo apt-get update && sudo apt-get install -yqq daemonize dbus-user-session fontconfig
echo "Successfully retrieved apt packages..."

sudo cp "$self_dir/start-systemd-namespace" /usr/sbin/start-systemd-namespace
sudo cp "$self_dir/enter-systemd-namespace" /usr/sbin/enter-systemd-namespace
sudo chmod +x /usr/sbin/enter-systemd-namespace
echo "Successfully installed systemd..."

sudo tee /etc/sudoers.d/systemd-namespace >/dev/null <<EOF
Defaults        env_keep += WSLPATH
Defaults        env_keep += WSLENV
Defaults        env_keep += WSL_INTEROP
Defaults        env_keep += WSL_DISTRO_NAME
Defaults        env_keep += PRE_NAMESPACE_PATH
Defaults        env_keep += PRE_NAMESPACE_PWD
%sudo ALL=(ALL) NOPASSWD: /usr/sbin/enter-systemd-namespace
EOF
echo "Successfully configured systemd..."

if ! grep 'start-systemd-namespace' /etc/bash.bashrc >/dev/null; then
  sudo sed -i 2a"# Start or enter a PID namespace in WSL2\nsource /usr/sbin/start-systemd-namespace\n" /etc/bash.bashrc
fi

sudo rm -f /etc/systemd/user/sockets.target.wants/dirmngr.socket
sudo rm -f /etc/systemd/user/sockets.target.wants/gpg-agent*.socket
sudo rm -f /lib/systemd/system/sysinit.target.wants/proc-sys-fs-binfmt_misc.automount
sudo rm -f /lib/systemd/system/sysinit.target.wants/proc-sys-fs-binfmt_misc.mount
sudo rm -f /lib/systemd/system/sysinit.target.wants/systemd-binfmt.service

if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ] && [ "$(head -n1  /proc/sys/fs/binfmt_misc/WSLInterop)" == "enabled" ]; then
  "$(interop_prefix)$(sysdrive_prefix)"/Windows/System32/cmd.exe /C setx WSLENV BASH_ENV/u
  "$(interop_prefix)$(sysdrive_prefix)"/Windows/System32/cmd.exe /C setx BASH_ENV /etc/bash.bashrc
else
  echo
  echo "You need to manually run the following two commands in Windows' cmd.exe:"
  echo
  echo "  setx WSLENV BASH_ENV/u"
  echo "  setx BASH_ENV /etc/bash.bashrc"
  echo
fi

echo "Done! Please reboot your WSL2 distribution."
