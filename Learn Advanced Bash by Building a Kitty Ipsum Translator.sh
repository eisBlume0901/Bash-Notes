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

wc kitty_ipsum_1.txt - takes the numerical values and the name of the file
OUTPUT:
27 332 1744 kitty_ipsum_1.txt
27 - lines
332 - words
1744 - bytes

wc -l kitty_ipsum_1.txt - takes the numerical values and the name of the file
OUTPUT:
27 kitty_ipsum_1.txt

wc -w kitty_ipsum_1.txt - takes the numerical values and the name of the file
OUTPUT:
332 kitty_ipsum_1.txt

wc -m kitty_ipsum_1.txt - takes the numberical values and the name of the file
OUTPUT:
1738 kitty_ipsum_1.txt

cat kitty_ipsum_1.txt | wc - only takes the numerical values
- opens the file data of kitty_ipsum_1.txt then wc counts the number of lines, words, and bytes of the file
OUTPUT:
     27     332    1744

wc < kitty_ipsum_1.txt - only takes the numerical values
OUTPUT:
     27     332    1744

echo "~~ kitty_ipsum_1.txt info ~~" > kitty_info.txt
- creates a new file named kitty_info.txt. Redirects the data / input command to the new file

echo -e "\nNumber of lines:" >> kitty_info.txt
- appends a new data to the kitty_info.txt

wc -m < kitty_ipsum_1.txt >> kitty_info.txt vs wc -m kitty_ipsum_1.txt >> kitty_info.txt
wc -m < kitty_ipsum_1.txt >> kitty_info.txt 
- appends the value of 1738 only
wc -m kitty_ipsum_1.txt >> kitty_info.txt
- appends the value of 1738 kitty_ipsum_1.txt

grep 'meow' kitty_ipsum_1.txt
- returns lines of sentences where the 'meow' appears

grep --color 'meow' kitty_ipsum_1.txt
- returns lines of sentences where the 'meow' appears but the meow is highlighted with red

grep --color -n 'meow' kitty_ipsum_1.txt
- returns lines of sentences where the 'meow' appears but the meow is highlighted with red and at what nth place of line does the word appears

grep --color -n 'meow[a-z]*' kitty_ipsum_1.txt
- returns lines of sentences where the word meow (starting with meow then with other characters) is highligted with red and at what nth place of line does the word appears

grep -c 'meow[a-z]*' kitty_ipsum_1.txt
- returns how many lines of sentences does the word  meow (starting with meow then with other characters) appears in the file

grep -c 'meow[a-z]*' kitty_ipsum_1.txt
OUTPUT:
meow
meow
meow
meow
meow
meowzer
meow

 grep -o 'meow[a-z]*' kitty_ipsum_1.txt | wc -l
- first grep prints out all values (possibly string) that starts with meow with other characters appended to it then wc -l counts those values
OUTPUT:
7

grep -o 'meow[a-z]*' kitty_ipsum_1.txt | wc -l >> kitty_info.txt
- first grep prints out all values (possibly string) that starts with meow with other characters appended to it then wc -l counts those values then appends it to kitty_info.txt

sed 's/r/2/' name.txt
ORIGINAL: freeCodeCamp
OUTPUT: f2eeCodeCamp

grep -n 'meow[a-z]*' kitty_ipsum_1.txt - compare it with grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/[0-9]+/1/'
OUTPUT: 
1:hide from vacuum cleaner meow for catnip and act crazy steal
4:shirt howl or gimme attention meow bye and eat grass, meow, and
10:i stare at it i meow at it i do a wiggle come here birdy ears
22:eat sniff catnip meow meowzer. good morning sunshine. lick human chase
23:the pig around the house meow run in circles. always ensure to

grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/[0-9]+/1/' - compare it with grep -n 'meow[a-z]*' kitty_ipsum_1.txt
OUTPUT:
1:hide from vacuum cleaner meow for catnip and act crazy steal
1:shirt howl or gimme attention meow bye and eat grass, meow, and
1:i stare at it i meow at it i do a wiggle come here birdy ears
1:eat sniff catnip meow meowzer. good morning sunshine. lick human chase
1:the pig around the house meow run in circles. always ensure to

grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' - compare it with grep -n 'meow[a-z]*' kitty_ipsum_1.txt
- ([0-9]+).* checks the digits only (if you use [0-9]+ it only checks ones digit but with .* it checks tens, hundreds and so forth also, repeating numbers like 11, 22)
1
4
10
22
23

Inside translate.sh
#!/bin/bash

cat $1

./translate kitty_ipsum_1.txt - reads the contents of the file
 ./translate.sh < kitty_ipsum_1.txt - also reads the contents of the file (has same output as ./translate kitty_ipsum_1.txt 
cat kitty_ipsum_1.txt | ./translate.sh - also reads the contents of the file (has same output as the two)

./translate.sh kitty_ipsum_1.txt | grep --color -E 'dog[a-z]*|woof[a-z]*'
hide from vacuum cleaner woof for dogchow and act crazy steal
vacuum cleaner. lick owner’s face while dog sleeps on a black
shirt howl or gimme attention woof bye and eat grass, meow, and
trip on dogchow good morning sunshine. this human feeds me, i
i stare at it i woof at it i do a wiggle come here birdy ears
foot. we are 3 small dogs sleeping most of our time, we are
owner because nose is wet dog. leave hair everywhere give me attention
eat sniff dogchow woof meowzer. good morning sunshine. lick human chase
the pig around the house woof run in circles. always ensure to

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
grep - also called as global regular expression print, command for searching patterns in a text
grep --color 'word/expression' file1.txt - returns line of sentences where the word appears with the word highligted with red
grep --color -n 'word/expression' file1.txt - returns line of sentences where the word appears with the word highligted with red and at what nth place of line (using integers) does the word appears
grep  -c 'word/expression' file1.txt - returns the number of times in each line (not the total count of the word) it appears the file
grep -o word/expression' file1.txt - -o means only matching, instead of printing the entire line for each match, it will only print the part of the line that matches the pattern
sed 's/pattern_to_replace/new_pattern_to_replace_the_old_one/' file1.txt - replace the pattern of the data / value inside the file (case sensitive - sed without i)
sed 's/pattern_to_replace/new_pattern_to_replace_the_old_one/i' file1.txt - case insensitive (sed with i)
sed -E 's/pattern_to_replace/new_pattern_to_replace_the_old_one/' file1.txt - replaces all  (sed with -E)
sed 's/old/new/ ; s/old1/new1/' - chaining two seds
grep --color -E 'word/expression | word1/expression1' file1.txt - chainining two grep (finding two occurrences) (grep with | and -E)
| - logical or, used for sed, grep (not as a pipe)
diff file1 file2 - shows the difference between two files
diff --color file1 file2 - shows the difference between two files with color
