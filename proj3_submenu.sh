#!/bin/sh

wait_continue()
{
	read -p  "Press [Enter] key to continue..."
}
handle_one()
{
	echo "----------------------------------------------------"
	echo "              System Information                    "
	echo "----------------------------------------------------"
	printf "%b\n" "$(/usr/bin/lsb_release -a)"
	wait_continue
}
handle_two()
{
	echo "----------------------------------------------------"
	echo "              Hostname and DNS information          "
	echo "----------------------------------------------------"
	HOST=$(hostname -A)
	echo "Hostname: $HOST"
}
handle_three()
{
	echo "----------------------------------------------------"
	echo "              Network Information                   "
	echo "----------------------------------------------------"
	NUMINTERFACE=$(/bin/ls -A /sys/class/net | wc -l)
	echo "Total network inferfaces found: $NUMINTERFACE"
	echo "*** IP Address Information ***"
	printf "%b\n" "$(ip addr show)"
	echo "***********************"
	echo "*** Network Routing ***"
	echo "***********************"
	printf "%b\n" "$(netstat -nr)"
	echo "*************************************"
	echo "*** Interface Traffic Information ***"
	echo "*************************************"
	printf "%b\n" "$(netstat -i)"
	wait_continue
}

handle_four()
{
	echo "----------------------------------------------------"
	echo "              Who is online                         "
	echo "----------------------------------------------------"
	echo "NAME            LINE TIME             COMMENT       "
	echo $(/bin/who)
	wait_continue
}
handle_six()
{
	echo "----------------------------------------------------"
	echo "              Public IP information                 "
	echo "----------------------------------------------------"
	echo "$(dig +short myip.opendns.com @resolver1.opendns.com)"
	wait_continue
}
handle_seven()
{

	echo "----------------------------------------------------"
	echo "              Disk Usage Info                       "
	echo "----------------------------------------------------"
	printf "%b\n" "$(df --output=pcent,target)"
	wait_continue
}
handle_eight()
{

}

case $1 in
	1)
		{
			handle_one
		};;
	3)
		{
			handle_three
		};;
	4)
		{
			handle_four
		};;
	6)
		{
			handle_six
		};;
	7)
		{
			handle_seven
		};;
	*)
		{
			echo "An error has occurred: check project file"
		};;
esac
