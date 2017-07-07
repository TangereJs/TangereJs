compname=$1

#--- validate command line paramters ---
if test $# -lt 1 ; then
	echo "Usage: testcomp.sh component-name"
	exit 1
fi
#--- restore repos with "our" code from components.list file ---
echo "starting component test"
# this is how you get parent folder path, because unix
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd components
cd $compname
ln -s $parent_path/components /bower_components
wct

