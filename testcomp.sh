compname=$1

#--- validate command line paramters ---
if test $# -lt 1 ; then
	echo "Usage: testcomp.sh component-name"
	exit 1
fi
#--- restore repos with "our" code from components.list file ---
echo "starting component test"

cd ./components
ls -1
cd ./$compname
ls -1
ln -s /home/travis/build/ijgithub/TangereJs/components ./bower_components
ls -1
xvfb-run wct
