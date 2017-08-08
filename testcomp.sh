compname=$1

#--- validate command line paramters ---
if test $# -lt 1 ; then
	echo "Usage: testcomp.sh component-name"
	exit 1
fi
#--- restore repos with "our" code from components.list file ---
echo "starting component test"


cd components
cd $compname
echo "This is sparta!"
# cp -R ../components /bower_components
wct

