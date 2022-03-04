file1=$(cat $1)
file2=$(cat $2)
res=$[ $file1 + $file2 ]
echo $res
