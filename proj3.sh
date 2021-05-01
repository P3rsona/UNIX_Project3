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
				echo "You have selected operating system info"
			};;
		2)
			{
				echo "You have selected hostname and Dns info"
			};;
		3)
			{
				echo "You have selected operating system info"
			};;
		4)
			{
				echo "You have selected hostname and Dns info"
			};;
		5)
			{
				echo "You have selected hostname and Dns info"
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
				echo "You have selected operating system info"
			};;
		9)
			{
				echo "You have selected hostname and Dns info"
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
