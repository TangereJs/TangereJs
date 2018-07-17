compname=$1

startdate=$(date +%x_%H:%M:%S:%N)
startdatems=$(($(date +%s%N)/1000000))

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

testresult="missing"

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

script_result=0

if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  win_build_dir=$( echo $build_dir | sed 's/^\///' | sed 's/\//\\/g' | sed 's/^./\0:/' )
  win_tangerejs_dir=$( echo $tangerejs_dir | sed 's/^\///' | sed 's/\//\\/g' | sed 's/^./\0:/' )
  cmd <<< "copy ${win_tangerejs_dir}\win-wct.conf.json wct.conf.json"
  cmd <<< "mklink /D bower_components ${win_build_dir}"  
  wct --skip-selenium-install
  result=$?
  enddate=$(date +%x_%H:%M:%S:%N)
  enddatems=$(($(date +%s%N)/1000000))

  if [ $result -eq 0 ]; then
    testresult="success"
    echo "${compname}" >> ${tangerejs_dir}/tests_success.log
  else 
    testresult="failure"
    script_result=1
    echo "${compname}" >> ${tangerejs_dir}/tests_failure.log
  fi
  cmd <<< "rmdir bower_components"
  cmd <<< "del wct.conf.json"
else
  ln -s $TRAVIS_BUILD_DIR/components ./bower_components
  xvfb-run -a wct --skip-selenium-install --skip-update-check --color --skip-plugin BABEL --compile never
  result=$?

  enddatems=$(($(date +%s%N)/1000000))
  if [ $result -eq 0 ]; then
    testresult="success"
    echo "${compname}" >> ${tangerejs_dir}/tests_success.log
  else 
    testresult="failure"
    script_result=1
    echo "${compname}" >> ${tangerejs_dir}/tests_failure.log
  fi
fi
totalms=$(expr $enddatems - $startdatems)
echo "Tests for ${compname} executed in ${totalms} milliseconds"
echo "${compname},${totalms},${testresult}" >> ${tangerejs_dir}/tests_csv.log
exit $script_result
