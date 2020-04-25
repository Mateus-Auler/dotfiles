export TERMINAL="alacritty"
export BROWSER="firefox-developer-edition"

set fish_greeting

set -l short_dir $HOME/.shortcuts

echo $PATH | grep $short_dir > /dev/null || set PATH "$PATH:$short_dir"

alias g='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

abbr --add p pushd
abbr --add o popd

alias hexdump="hexdump -C"

alias la="ls -lAh"

fish_vi_key_bindings

if test (tty) = "/dev/tty1" && ! pgrep i3;
	test -f $HOME/.scripts/mount_devices.sh && $HOME/.scripts/mount_devices.sh &
	lsmod | grep pcspkr > /dev/null && sudo rmmod pcspkr &
	startx
end
