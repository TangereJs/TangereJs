startdate=$(date +%x_%H:%M:%S:%N)
echo "TangereJs testing started at ${startdate}";

rm tests_missing.log
rm tests_failure.log
rm tests_success.log

while read line
do
  if [[ $line ]]; then
    bash testcomp.sh $line
  fi
done < components.list

echo
echo "######## Missing tests ########"
cat tests_missing.log

echo
echo "######## Successfull tests ########"
cat tests_success.log

echo
echo "######## Failed tests ########"
cat tests_failure.log

startdate=$(date +%x_%H:%M:%S:%N)
echo "TangereJs testing ended at ${startdate}";
