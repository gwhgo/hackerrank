compute(){
	str=$1
	tmp=`bc <<< '''scale=4
	'$str'
	'''`
	if [[ $tmp > 0 ]];then
		sign=1
	elif [[ $tmp == 0 ]];then
		sign=0
	else
		sign=-1
	fi
	result=`bc <<< '''scale=4
	'$tmp'+ 0.0005*sign
	'''`
	printf %0.3f $result
}

read count
for((i=1;i<=count;i++));do
	read myarr[$i]
done

expression=`echo ${myarr[@]} | sed 's/ /+/g'`
expression="($expression)/$count"
compute $expression
