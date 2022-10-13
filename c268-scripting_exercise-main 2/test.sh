#!/bin/bash
: '
n1=3
n2=4
p=1
p=$(( n1 * n2 ))

echo $p

#for loop product
read -p "Enter a number: " number
i=1
while [ $i -le 10 ]
do
	echo "$number * $i = $((number*i))"
	i=$((i+1))
done

'
: '
function favouriteShow()
{
	result=$show
	echo $show
}

echo "Enter show"
read show
val=$(favouriteShow)
echo "youe show is $val"
'

#variable
echo `sort -nr testNumber.txt`

exit 0



