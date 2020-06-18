awk 'BEGIN {flag=0}
{	
	if(flag){
		print $0
	} else{
		printf "%s;",$0
	}
	flag = 1 - flag;
}
END {}' file.txt
