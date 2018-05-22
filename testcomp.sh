compname=$1

startdate=$(date +%x_%H:%M:%S:%N)
echo "${compname} testing started at ${startdate}";


#--- validate command line paramters ---
if test $# -lt 1 ; then
  echo "Usage: testcomp.sh component-name"
  exit 1
fi
#--- restore repos with "our" code from components.list file ---
echo "Starting tests for ${compname}"

tangerejs_dir=$(pwd)

cd ./components
build_dir=$(pwd)

cd ./$compname

if [ ! -d "test" ]; then
  # echo "${compname} component doesn't have tests";
  echo "${compname}" >> ${tangerejs_dir}/tests_missing.log
  exit 0
fi

if [ ! -e "test/index.html" ]; then
  # echo "${compname} component doesn't have tests";
  echo "${compname}" >> ${tangerejs_dir}/tests_missing.log
  exit 0
fi

if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  win_build_dir=$( echo $build_dir | sed 's/^\///' | sed 's/\//\\/g' | sed 's/^./\0:/' )
  win_tangerejs_dir=$( echo $tangerejs_dir | sed 's/^\///' | sed 's/\//\\/g' | sed 's/^./\0:/' )
  cmd <<< "copy ${win_tangerejs_dir}\win-wct.conf.json wct.conf.json"
  cmd <<< "mklink /D bower_components ${win_build_dir}"  
  wct --skip-selenium-install
  result=$?
  if [ $result -eq 0 ]; then
    echo "${compname}" >> ${tangerejs_dir}/tests_success.log
  else 
    echo "${compname}" >> ${tangerejs_dir}/tests_failure.log
  fi
  cmd <<< "rmdir bower_components"
  cmd <<< "del wct.conf.json"
else
  ln -s $TRAVIS_BUILD_DIR/components ./bower_components
  xvfb-run -a wct
  result=$?
  if [ $result -eq 0 ]; then
    echo "${compname}" >> ${tangerejs_dir}/tests_success.log
  else 
    echo "${compname}" >> ${tangerejs_dir}/tests_failure.log
  fi
fi

enddate=$(date +%x_%H:%M:%S:%N)
echo "${compname} testing ended at ${enddate}";
