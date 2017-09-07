
while read line
do
  if [[ $line ]]; then
    bash testcomp.sh $line
  fi
done < components.list
