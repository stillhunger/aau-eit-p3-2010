#!/bin/bash
while (1); do
	echo "Getting the latest source..."
	svn checkout http://aau-eit-p3-2010.googlecode.com/svn/trunk/ aau-eit-p3-2010 > /dev/null
	cd aau-eit-p3-2010
	echo "Creating backup..."
	mv "rapport.pdf" "rapport.pdf.bak"
	echo "Building rapport.pdf..."
	~/Scripts/build-latex.sh 'rapport.tex' > /dev/null
	if [[ $? == 0 ]]; then
		echo "Connecting to AFS..."
		klog USERNAME -password PASSWORD
		check=$(tokens | grep afs@ies.auc.dk)
		if [[ "$check" == "" ]]; then
			echo "ERROR: Unable to get afs token! ..."
		else
			echo "Sending to www...."
			cp "rapport.pdf" /afs/ies.auc.dk/group/10gr311/public_html/
			echo "Deleting backup..."
			rm "rapport.pdf.bak"
		fi
	else
		echo "ERROR: BUILD FAILD! Restoring from backup..."
		rm "rapport.pdf"
		mv "rapport.pdf.bak" "rapport.pdf"
		#Add something for indicating the error...
	fi
	cd ..
	echo "Done... I'll be back in a hour :)"
	sleep 1h
done
