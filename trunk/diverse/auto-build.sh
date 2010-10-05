#!/bin/bash
while (1); do
	echo "Getting the latest source..."
	svn checkout http://aau-eit-p3-2010.googlecode.com/svn/trunk/ aau-eit-p3-2010
	echo "Creating backup..."
	mv rapport.pdf rapport.pdf.bak
	echo "Building rapport.pdf..."
	~/Scripts/build-latex.sh 'rapport.tex'
	if [[ $? == 0 ]]; then
		echo "Connecting to AFS..."
		#openafs --something
		echo "Sending to www...."
		cp rapport.pdf /afs/ies.aau.dk/group/10gr309/web.....
	else
		echo "BUILD FAILD! Restoring from backup..."
		rm rapport.pdf
		mv rapport.pdf.bak rapport.pdf
		#Add something for indicating the error...
	fi
	echo "Done... I'll be back in a hour :)"
	sleep 1h
done
