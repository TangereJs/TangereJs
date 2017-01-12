user=$1
pass=$2

#--- validate command line paramters ---
if test $# -lt 2 ; then
	echo "Usage: pull-all.sh <<userName>> <<password>>"
	exit 1
fi



#--- restore repos with "our" code from components.list file ---
echo "start: reset our components"
while read line
do
	if [[ $line ]]; then		
		rm -r components/$line 2>/dev/null
		mv components/__$line components/$line
		bash pull-repo.sh $user $pass $line components
	fi
done < components.list

