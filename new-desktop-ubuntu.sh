#!/usr/bin/bash

echo 'kernel.perf_event_paranoid = -1
net.ipv4.tcp_rmem=40960 873800 62914560
net.core.rmem_max=25000000' >> /etc/sysctl.conf

apt install git
apt install curl
apt install calibre
snap install dbgate
snap install alacritty --classic

# TODO Set tdrop shortcuts:
# S-z : tdrop -h 100% -s 1 alacritty
# F12 : tdrop -h 100% -s 1 alacritty
# S-x : tdrop -h 100% emacs
# S-c : tdrop -h 100% brave
