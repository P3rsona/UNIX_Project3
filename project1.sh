#!/bin/sh

#This is the revision for project1

#recursive function for traversing directories
traverse(){
echo '<ul>' >> $1
LIST=$(/bin/ls)
for item in $LIST
do
	if [ -d $item ] ; then
		if [ -r $item ] ; then
			echo '<li>' >> $1
			cd $item
			echo $item >> $1
			traverse $1 
			echo '</li>' >> $1
		fi
	else
		if [ -r $item ] ; then 
			echo '<li>' >> $1
			echo $item >> $1
			echo '</li>' >> $1
		fi
	fi
done
cd ..
echo '</ul>' >> $1
}

#Task 1: Check for valid number of arguments
if [ $# -eq 2 ] ; then
	echo '<!DOCTYPE html>' > $2
	echo '<html>' >> $2
	echo '<body>' >> $2

	#Task 2: Find and switch to the root directory	
	MYFILENAME=$1
	ROOT_DIR=${MYFILENAME##*/}
	cd /$HOME
	echo $(/bin/pwd)
	LOCATION=$(find $HOME -name $ROOT_DIR)
	cd $LOCATION
	echo $ROOT_DIR >> $2
	
	#Task 3: Traverse Subdirectories and output them to html file.
	traverse $2 	
	
	echo '</body>' >> $2
	echo '</html>' >> $2

else
	echo "Invalid number of arguments: number of arguments is $# when it should be 2"
	echo "The first argument should be the top directory and the second argument should be an output file with the html extension."
fi
