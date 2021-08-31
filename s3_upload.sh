to_day=$(date +"%Y%m%d")
echo $to_day'.log'
cp access_log log/$to_day'.log'
sed -e 's/\[//g' log/$to_day'.log' > log/$to_day
sed -e 's/\]//g' log/$to_day > log/$to_day'.txt'
echo $to_day'.txt'
rm log/$to_day
rm log/$to_day'.log'
aws s3 cp $to_day'.txt'  s3://{{'s3 name'}}
