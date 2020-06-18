while read line
do 
 my_array+=( $line ) 
done

for i in {3..7}
do
    printf -- '%s ' "${my_array[$i]}"
done

