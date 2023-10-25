#!/bin/bash

echo "Welcome to PipeManager!"
echo "======================="


while :
do
echo "S: Change sample rate | B: Change buffer size | V: View current settings | R: Restart pipewire | E: Exit program "
echo "======================="
read -p "Selection: " userselection

case $userselection in
	B)
		echo "Some examples of buffer sizes are 64, 128, 256, 512, 1024, 2048."
		read -p 'What would you like the buffer size to be?' buffersizevar
		pw-metadata -n settings 0 clock.force-quantum $buffersizevar
		;;
	S)
		echo "Some examples of sample rates are 44100, 48000, 88200, 96000."
		read -p 'What would you like the sample rate to be?' sampleratevar
		pw-metadata -n settings 0 clock.force-rate $sampleratevar
		;;		
	V)
		pw-metadata -n settings
		echo "======================="
		;;
	R)
		systemctl --user restart pipewire
		;;
	E)
		break
		;;		
esac
done
