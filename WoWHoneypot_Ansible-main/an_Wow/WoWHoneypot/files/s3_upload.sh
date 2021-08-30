to_day=$(date +"%Y%m%d")
echo $to_day'.log'
cp access_log $to_day'.log'
sed -e 's/\[//g' $to_day'.log' > $to_day
sed -e 's/\]//g' $to_day > $to_day'.txt'
rm $to_day
aws s3 cp $to_day'.txt'  s3://{{}}
rm $to_day'.log'
rm $to_day'.txt'