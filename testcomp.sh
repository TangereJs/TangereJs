compname=$1

#--- validate command line paramters ---
if test $# -lt 1 ; then
  echo "Usage: testcomp.sh component-name"
  exit 1
fi
#--- restore repos with "our" code from components.list file ---
echo 
echo 
echo 
echo 
echo "Starting tests for ${compname}"

tangerejs_dir=$(pwd)

cd ./components
build_dir=$(pwd)

cd ./$compname

if [ ! -d "test" ]; then
  echo "${compname} component doesn't have tests";
  exit 1
fi

if [ ! -e "test/index.html" ]; then
  echo "${compname} component doesn't have tests";
  exit 1
fi

if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  echo "Running the WINDOWS branch"
  win_build_dir=$( echo $build_dir | sed 's/^\///' | sed 's/\//\\/g' | sed 's/^./\0:/' )
  win_tangerejs_dir=$( echo $tangerejs_dir | sed 's/^\///' | sed 's/\//\\/g' | sed 's/^./\0:/' )
  cmd <<< "copy ${win_tangerejs_dir}\wct.conf.json wct.conf.json"
  cmd <<< "mklink /D bower_components ${win_build_dir}"  
  wct --skip-selenium-install --configFile custom-wct.config.json
  cmd <<< "rmdir bower_components"
  cmd <<< "del wct.conf.json"
else
  echo "Running the LINUX branch"
  ln -s $TRAVIS_BUILD_DIR/components ./bower_components
  xvfb-run wct
fi