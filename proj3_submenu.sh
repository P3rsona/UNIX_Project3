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
	OS=$(uname -a | cut -d" " -f1)
	echo "Operating Systyem: $OS" 
	printf "%b\n" "$(/usr/bin/lsb_release -a)"
	wait_continue
}
handle_two()
{
	echo "----------------------------------------------------"
	echo "              Hostname and DNS information          "
	echo "----------------------------------------------------"
	HOST=$(hostname)
	DOMAINNAME=$(dnsdomainname)
	FQDN=$(hostname -f)
	IPADD=$(hostname -i | cut -d" " -f2)
	NAMESERV=$(grep 'nameserver' /etc/resolv.conf)
	echo "Hostname: $HOST"
	echo "DNS Domain: $DOMAINNAME"
	echo "Fully qualififed domain name: $FQDN"
	echo "Network address (IP): $IPADD"
	echo "DNS name servers (DNS IP): $NAMERSERV"
	wait_continue
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
handle_five()
{
	echo "----------------------------------------------------"
	echo "              List of last logged in Users          "
	echo "----------------------------------------------------"
	printf "%b\n" "$(last -R | sort -u)"
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
	CURRDIR=$(/bin/pwd)
	sh ./project1.sh ./$HOME $CURRDIR/filetree.html
}
handle_nine()
{
	echo "****************************************************"
	echo "*** Process was not implemented for this project ***"
	echo "****************************************************"
	wait_continue
}

case $1 in
	1)
		{
			handle_one
		};;
	2)
		{
			handle_two
		};;
	3)
		{
			handle_three
		};;
	4)
		{
			handle_four
		};;
	5)
		{
			handle_five
		};;
	6)
		{
			handle_six
		};;
	7)
		{
			handle_seven
		};;
	8)
		{
			handle_eight
		};;
	9)
		{
			handle_nine
		};;
	*)
		{
			echo "An error has occurred: check project file"
		};;
esac
