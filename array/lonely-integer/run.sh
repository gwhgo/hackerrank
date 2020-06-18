read n
# num array is dense
read -a num
#n=$((${#num[@]}))


#input the first value
array[0]=${num[0]}

#iterate the num(array0
for((i=1;i<$n;i=i+1))
do
	#echo NUM:${num[$i]}
	j=0
	if [ "${#array[@]}" == "0" ];then
		#echo Nothing on array
		array[$i]=${num[$i]}
	else
		#echo Something in array
		#iterate the array, find if we have a vlaue cn match
		while [ "$j" != "$n" ]
		do
			#get a vlaue match
			if [ "${array[$j]}" == "${num[$i]}" ];then
				#echo Unset array[$i]
				unset array[$j]
				break
			fi
			j=$(($j+1))
		done
		# if the input is not matched, we input it to the array
		if [ "$j" == "$n" ];then
			array[$i]=${num[$i]}
		fi
	fi
done

echo ${array[@]}
