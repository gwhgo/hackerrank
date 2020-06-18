href:
	https://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples/
Syntax:
	awk '/search pattern/{Actions}
	     /serach pattern/{Actions}' file

- search pattern is a regular expression
- Actions - statement(s) to be performed.
- several patterns and actions are possible in Awk
- file - Input file
- Single qoutes around program is to avoid shell not to interpret any of its special characters. 


Awk Working Methodology

1. Awk reads the input files one line at a time. 
2. For each line, it matches with given pattern in the given order, if mathes performs the corresponding action.
3. If no pattern matches, no action will be perfomed. 
4. in the above syntax, either search pattern or action are optional, But not both.
5. If the search pattern is not given, then Awk performes the given actions for each line of the input. 
6. if the action is not given, print all that lines that matches with the given patterns which is the default action.
7. Empty braces with out any action does nothin. It wont perform defualt printing operation. 
8. Each statement in Actions should be delimited by semicolon.





Awk has two imporant patterns which are specified by the keyword called BEGIN and END. 
Syntax:
BEGIN {Actions}
{ACTION} # ACGTION for everyline in a file
END {Actions}

#is for comments in Awk


awk '{$1=$1}'1'
- Would trim leading and trailing space or tab characters and also squeeze sequences of tabs and spaces into a single space. 
That's just an awk idiom that orces it to recompute the value of $1. It's deleting leading spaces becuae by defualt, awk ignores them when readling values into vars. Personally I'd never use that syntax; it's ugly(it's intentionally obfucated -- there is more explicty way to write it) and won't always work depending on filename. Perl is better for that sort of job. 
```
perl -pi.bak -e 's/^\s+//' file.txt
```
This will remove leading spaces and tabs from file.txt, making a backup of the origianl just in case as file.txt.bak.





