awk 'BEGIN {}
{
	total=0; 
	for(i=1;i<=NF;i++)  
	total+=$i; 
	avg=total/(NF-1); 
	#print avg;
	if(avg < 50){
		print $0" : FAIL"
	} else if(avg < 60){
		print $0" : C"
	} else if (avg < 80){
		print $0" : B"
	} else {
		print $0" : A"
	}
} 
END { }' file.txt


