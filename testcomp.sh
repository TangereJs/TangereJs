compname=$1

#--- validate command line paramters ---
if test $# -lt 1 ; then
	echo "Usage: testcomp.sh component-name"
	exit 1
fi
#--- restore repos with "our" code from components.list file ---
echo "starting component test"
echo $TRAVIS_BUILD_DIR

cd ./components
cd ./$compname
# main problem with travis is how to get the /home/travis/build/ijgithub/TangereJs part
# 
ln -s /home/travis/build/ijgithub/TangereJs/components ./bower_components
xvfb-run wct
