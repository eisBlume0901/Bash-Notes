Bash Notes

echo hello bash > stdout.txt 

> - creates and redirects the output (e.g., print statement) to a file
 - it is expected that a file contains a string "hello bash"

> stdout.txt
- it is expected that a file contains an empty string

echo hello bash >> stdout.txt
>> - appends the command to the file
- it is expected that a file contains a string "hello bash"

bad_command
- invalid command

bad_command > stderr.txt
- redirects the non-existing command to the file 

bad_command 2> stderr.txt
- redirects the error message of the non-existent command to the file

read NAME > stdin
- read is for user input / getting user input
- stdin (standard in) asks for the input

echo $NAME
- calls the existing and current terminal variable

read NAME < name.txt
command line interface
echo $NAME
- reads the data from the given file and then displaying (echo) it out 

echo Banana | read NAME
echo $NAME
- echo prints the string "Banana" and stores it to NAME variable (not good though, it didnt print the expected value "Banana"

echo Banana | read NAME
cat $NAME
- the string "Banana" was read and printed out

cat name.txt
- reads the content of the file

echo BANANA | cat
- it works the same with just echo BANANA which prints out the value "BANANA" to the console

cat < name.txt
- redirects the read file to another file named  name.txt, for instance, the variable is set to "Banana" then its content is saved to name.txt

command line interface with bash file
touch script.sh - creates a new file named script.sh
#!/bin/bash - to specify that the script is bash
read NAME
echo Hello $NAME
bad_command

command-line interface - version 1
./script.sh - runs the file
OUTPUT:
Banana
Hello Banana
./script.sh: line 4: bad_command: command not found

command-line interface - version 2
echo Banana | ./script.sh
OUTPUT:
Hello Banana
./script.sh: line 4: bad_command: command not found

command-line interface -version 3
echo Banana | ./script.sh 2> stderr.txt
- redirects the error to stderr.txt
OUTPUT:
Hello Banana

command-line interface -version 4
echo Banana | ./script.sh 2> stderr.txt > stdout.txt
- redirects the error to stderrr.txt, redirects the output to stdout.txt

command-line interface -version 5
./script.sh < name.txt 
- reads the script first, then reads the file name.txt, takes the data into the script then it is executed
OUTPUT:
Hello Banana
./script.sh: line 4: bad_command: command not found

command-line interface -version 6
./script.sh < name.txt > stderr.txt
- reads the script first, then reads the data inside the file name.txt then its value is then used by the script. The error is redirected to stderr.txt
OUTPUT:
Hello Banana

command-line interface -version 7
./script.sh < name.txt 2> stderr.txt > stdout.txt
- reads the script first, then reads the data inside the file name.txt then its value is then used by the script. The error is redirected to stderr.txt, the output is redirected to stdout.txt

wc kitty_ipsum_1.txt
OUTPUT:
27 332 1744 kitty_ipsum_1.txt
27 - lines
332 - words
1744 - bytes

wc -l kitty_ipsum_1.txt
OUTPUT:
27 kitty_ipsum_1.txt

wc -w kitty_ipsum_1.txt
OUTPUT:
332 kitty_ipsum_1.txt

wc -m kitty_ipsum_1.txt
OUTPUT:
1738 kitty_ipsum_1.txt

cat kitty_ipsum_1.txt | wc
- opens the file data of kitty_ipsum_1.txt then wc counts the number of lines, words, and bytes of the file
OUTPUT:
     27     332    1744

wc < kitty_ipsum_1.txt
OUTPUT:
     27     332    1744

echo "~~ kitty_ipsum_1.txt info ~~" > kitty_info.txt
- creates a new file named kitty_info.txt. Redirects the data / input command to the new file

echo -e "\nNumber of lines:" >> kitty_info.txt
- appends a new data to the kitty_info.txt

> vs >> vs 2> vs 1> vs < vs |
> - output redirection, create or overwrite the file with new data specified (for new file or stdout, not for stderr) (command1 > file.txt)
>> - append to the file
2> - redirects the error message to the file (specifically stderr, not stderr.txt)
1> - redirects the command to the file (specifically stdout, not stdout.txt)
< - input redirection, takes the contents of a file and uses it as the input for a command (command1 < file1.txt)
| - also called pipe, used for chaining commands

stdout vs stderr
stdout (standard out)
stderr (standard error)

cat - prints the content of a file or input to stdout
control+c - to finish / exit / quit the command
touch - creates new bash script
chmod +x script.sh
wc - prints the word count of a file
man - a command to show the manual of a command
- man wc
wc -l file1.txt - prints how many lines (new lines) are there in the file
wc -w file1.txt - prints how many words are there in the file
wc -m file1.txt - prints how many characters are there in the file
