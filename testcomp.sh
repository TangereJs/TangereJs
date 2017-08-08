#compname=$1

#--- validate command line paramters ---
if test $# -lt 1 ; then
	echo "Usage: testcomp.sh component-name"
	exit 1
fi
#--- restore repos with "our" code from components.list file ---
echo "starting component test"


ls -1
cd components
ls -1
#cd $compname
cd at-carbon-badge
echo "This is sparta!"
cp -R ../components /bower_components
wct

