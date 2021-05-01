#!/bin/sh


CHOICE=11
while [ $CHOICE != 10 ] ; do
	echo $(/bin/date)
	echo "--------------------------------"
	echo "           Main Menu            "
	echo "--------------------------------"
	echo " 1. Operating system info       "
	echo " 2. Hostname and DNS info       "
	echo " 3. Network Info                "
	echo " 4. Who is online               "
	echo " 5. Last logged in users        "
	echo " 6. My IP address               "
	echo " 7. My disk usage               "
	echo " 8. My home file-tree           "
	echo " 9. Process Operations          "
	echo " 10. Exit                       "
	echo -n "Enter your choice [1 - 10]: "
	read CHOICE
	case $CHOICE in
		1)
			{
				sh ./proj3_submenu.sh 1
			};;
		2)
			{
				sh ./proj3_submenu.sh 2
			};;
		3)
			{
				sh ./proj3_submenu.sh 3
			};;
		4)
			{
				sh ./proj3_submenu.sh 4
			};;
		5)
			{
				sh ./proj3_submenu.sh 5
			};;
		6)
			{
				sh ./proj3_submenu.sh 6
			};;
		7)
			{
				sh ./proj3_submenu.sh 7
			};;
		8)
			{
				sh ./proj3_submenu.sh 8
			};;
		9)
			{
				sh ./proj3_submenu.sh 9
			};;
		10)
			{
				continue
			};;
		*)
			{
				echo "Error Unknown Value: Please select a value between 1 - 10."
			};;
	esac
	
done
