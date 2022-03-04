if [ $# -lt 2 ];
then
    echo "Not enough arguments"
    exit 0
fi
if [ $# -gt 2 ];
then
    echo "Too many arguments"
    exit 0
fi
file=$1
str=$2
if [ ! -f $file ]; 
then
    echo "File $file not exists."
    exit 0
fi
lines=$(grep -c "" $file)
echo "Count of lines: $lines"
if grep -wq $str $file;
then
    echo "String is in file"
else
    echo "String is not in file"
fi