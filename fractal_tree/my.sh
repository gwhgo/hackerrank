read iteration

#seems 2D array need -A , I don't know why
declare -A matrix
row=63
column=100
init(){
	for((i=1;i<=$row;i++));do
		for((j=1;j<=$column;j++));do
			matrix[$i,$j]='_'
		done
	done
}


print(){
	for((i=1;i<=$row;i++));do
		for((j=1;j<=$column;j++));do
			echo -n ${matrix[$i,$j]}
		done
		echo 
	done
}


#param1: get a iteration round number, return the length
#corresponding:
# 1 : 16 : 2^4 : 2^(5-1)
# 2 : 8  
# 3 : 4
# 4 : 2
# 5 : 1
length(){
	echo  $(echo "2^(5-$1)"|bc)	
}

# (x,y) is the bottom coordinate of our tree
# param1 : x ; 
# param2 : y ;
# param3 : round;
# param4 : length of our tree of trunk or branch, turnk == branch
draw(){
	local x  y  round  len next_round next_length next_x left_y right_y
	local index_x index_y
	local left_index_y right_index_y
	x=$1
	y=$2
	round=$3
	len=$4
	index_x=$x
	index_y=$y
	left_index_y=$(($y-1))
	right_index_y=$(($y+1))

	#len=$(length $round)
	next_round=$(($round + 1))
	next_length=$(length $next_round)
	next_x=$(($x - $len*2))
	left_y=$(($y -  $len))
	right_y=$(($y + $len))
	
	# test code
	#echo -e "next_round:\t"		$next_round
	#echo -e "next_length:\t"	$next_length
	#echo -e "next_x:\t"		$next_x
	#echo -e "left_y:\t"		$left_y
	#echo -e "right_y:\t"		$right_y
	
	
	for((i=1;i <= $len;i++)){
		matrix[$index_x,$index_y]="1"
		((index_x--))
	}
		
	for((i=1; i <= $len;i++)){
		matrix[$index_x,$left_index_y]="1"
		matrix[$index_x,$right_index_y]="1"
		((index_x--))
		((left_index_y--))
		((right_index_y++))
	}
	
	
	if [[ $next_round -le $iteration ]];then
		draw $next_x $left_y $next_round $next_length
		draw $next_x $right_y $next_round $next_length
	fi
}

#init the matrix
init


draw 63 50 1 16


#print the matrix
print

