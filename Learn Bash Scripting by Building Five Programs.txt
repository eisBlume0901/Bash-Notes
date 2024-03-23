Learn Bash Scripting by Building Five Programs

BASH
To create a new file
touch fileName 

To indicate that the system should be interpreted using Bash
#!/bin/bash - put inside the .sh file

To discover the full path to the executable binary that will be executed when you issue a particular command
which bash 
returns: /usr/bin/bash

To execute the .sh file
./fileName.sh

To display the list of what is inside the project folder and check the permission status
ls -l 
-l means long list format
returns: 
-rw-r-r-- (r = read, w = write)
-rwxr-xr-x  (-rwxr = readable, writable, executable by the owner, -xr = readable and executable by the group, x = executable by others)
- = Regular file
r = read permission (can read the file's content)
w = write permission (can modify the file)
x = execute permission (can run the file as a program)

To display the contents of the root directory
ls /
returns: (not exactly as it depends)
bin, etc, home, usr

To display the contents of the specific directory under root
ls /bin
returns: (not exactly as it depends)
git, git-shell, python3

To grant permissions of the created file 
chmod +x fileName.sh (x = execute)

To create a variable in .sh (bash) file
VARIABLE_NAME=VALUE; (no spaces)

To use the created variable in .sh (bash) file, add a dollar sign at the beginning of it
echo $VARIABLE_NAME - this will display the value of the VARIABLE_NAME

Inside the .sh file, you can ask for user input using
read NAME
echo Hello $NAME - will output the name inputted by the user

Finding more information about a command
1. ls --help
2. man echo (man means manual)
echo -e "\nHello\nWorld" enables backlash interpretation and \n interprets to new line

After executing the file,
./fileName.sh
using ctrl + c close and stops the program from further execution

Inside the .sh file, this command display all the command-line arguments passed to a script or command
echo $*
$* = represents all the command line arguments (to be inputted by the user), it contains all arguments as a single string separated by spaces
./countdown.sh arg1 arg2 arg3 
returns: arg1 arg2 arg3

echo $1 
$1 = access the first command line argument only and disregards the succeeding space separated strings
./countdown.sh arg1 arg2 arg3 
returns: arg1 

To display all shell commands defined internally, type help 
help
returns various commands such as 
if COMMANDS; then COMMANDS; [ elif COMMANDS; then COMM> - if else if then statement
for (( exp1; exp2; exp3); do COMMANDS; done - for loop statement


To see more information about the shell commands
help if
returns 
if: if COMMANDS; then COMMANDS; [ elif COMMANDS; then COMMANDS; ]... [ else COMMANDS; ] fi
    Execute commands based on conditional.
    
    The `if COMMANDS' list is executed.  If its exit status is zero, then the
    `then COMMANDS' list is executed.  Otherwise, each `elif COMMANDS' list is
    executed in turn, and if its exit status is zero, the corresponding
    `then COMMANDS' list is executed and the if command completes.  Otherwise,
    the `else COMMANDS' list is executed, if present.  The exit status of the
    entire construct is the exit status of the last command executed, or zero
    if no condition tested true.
    
    Exit Status:
    Returns the status of the last command executed.

help [[ expression ]]
returns
[[ ... ]]: [[ expression ]]
    Execute conditional command.
    
    Returns a status of 0 or 1 depending on the evaluation of the conditional
    expression EXPRESSION.  Expressions are composed of the same primaries used
    by the `test' builtin, and may be combined using the following operators:
    
      ( EXPRESSION )    Returns the value of EXPRESSION
      ! EXPRESSION              True if EXPRESSION is false; else false
      EXPR1 && EXPR2    True if both EXPR1 and EXPR2 are true; else false
      EXPR1 || EXPR2    True if either EXPR1 or EXPR2 is true; else false
    
    When the `==' and `!=' operators are used, the string to the right of
    the operator is used as a pattern and pattern matching is performed.
    When the `=~' operator is used, the string to the right of the operator
    is matched as a regular expression.
    
    The && and || operators do not evaluate EXPR2 if EXPR1 is sufficient to
    determine the expression's value.
    
    Exit Status:
    0 or 1 depending on value of EXPRESSION.
help test
returns
test: test [expr]
    Evaluate conditional expression.
    
    Exits with a status of 0 (true) or 1 (false) depending on
    the evaluation of EXPR.  Expressions may be unary or binary.  Unary
    expressions are often used to examine the status of a file.  There
    are string operators and numeric comparison operators as well.
    
    The behavior of test depends on the number of arguments.  Read the
    bash manual page for the complete specification.
    
    File operators:
    
      -a FILE        True if file exists.
      -b FILE        True if file is block special.
      -c FILE        True if file is character special.
      -d FILE        True if file is a directory.
      -e FILE        True if file exists.
      -f FILE        True if file exists and is a regular file.
      -g FILE        True if file is set-group-id.
      -h FILE        True if file is a symbolic link.
      -L FILE        True if file is a symbolic link.
      -k FILE        True if file has its `sticky' bit set.
      -p FILE        True if file is a named pipe.
      -r FILE        True if file is readable by you.
      -s FILE        True if file exists and is not empty.
      -S FILE        True if file is a socket.
      -t FD          True if FD is opened on a terminal.
      -u FILE        True if the file is set-user-id.
      -w FILE        True if the file is writable by you.
      -x FILE        True if the file is executable by you.
      -O FILE        True if the file is effectively owned by you.
      -G FILE        True if the file is effectively owned by your group.
      -N FILE        True if the file has been modified since it was last read.
    
      FILE1 -nt FILE2  True if file1 is newer than file2 (according to
                       modification date).
    
      FILE1 -ot FILE2  True if file1 is older than file2.
    
      FILE1 -ef FILE2  True if file1 is a hard link to file2.
    
    All file operators except -h and -L are acting on the target of a symbolic
    link, not on the symlink itself, if FILE is a symbolic link.
    
    String operators:
    
      -z STRING      True if string is empty.
    
      -n STRING
         STRING      True if string is not empty.
    
      STRING1 = STRING2
                     True if the strings are equal.
      STRING1 != STRING2
                     True if the strings are not equal.
      STRING1 < STRING2
                     True if STRING1 sorts before STRING2 lexicographically.
      STRING1 > STRING2
                     True if STRING1 sorts after STRING2 lexicographically.
    
    Other operators:
    
      -o OPTION      True if the shell option OPTION is enabled.
      -v VAR         True if the shell variable VAR is set.
      -R VAR         True if the shell variable VAR is set and is a name
                     reference.
      ! EXPR         True if expr is false.
      EXPR1 -a EXPR2 True if both expr1 AND expr2 are true.
      EXPR1 -o EXPR2 True if either expr1 OR expr2 is true.
    
      arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne,
                     -lt, -le, -gt, or -ge.
    
    Arithmetic binary operators return true if ARG1 is equal, not-equal,
    less-than, less-than-or-equal, greater-than, or greater-than-or-equal
    than ARG2.
    
    See the bash manual page bash(1) for the handling of parameters (i.e.
    missing parameters).
    
    Exit Status:
    Returns success if EXPR evaluates to true; fails if EXPR evaluates to
    false or an invalid argument is given.

if conditions accepted
if [[ $1 == arg1 ]] checks if the first command line is "arg1"
if [[ $1 -lt 5 ]] checks if the first command line is less than 5
-eq = equal
-ne = not equal
-lt = less than
-le = less than or equal
-gt = greater than
-ge = greater than or equal

Expressions can be run in terminal and script
using terminal:
camper:  /project$  [[ 4 -le 5 ]]
camper:  /project$  echo $? - checks the latest bash command if its true or false (if the expression is true or there is a file that exists)
returns 0 if true and 1 if false (which is unusual since 1 always means true and 0 means false in programming)

camper:  /project$  ls; echo $?
returns: 
countdown.sh  questionnaire.sh
0 (means that the file exists)

camper:  /project$  [[ -a countdowh.sh ]]; echo $?
returns:
0 (means that countdown.sh file exists)

camper:  /project$  [[ -x countdowh.sh ]]; echo $?
returns:
0 (means that countdown.sh file is executable by you - pertains to me)

help for 
for: for NAME [in WORDS ... ] ; do COMMANDS; done
    Execute commands for each member in a list.
    
    The `for' loop executes a sequence of commands for each member in a
    list of items.  If `in WORDS ...;' is not present, then `in "$@"' is
    assumed.  For each element in WORDS, NAME is set to that element, and
    the COMMANDS are executed.
    
    Exit Status:
    Returns the status of the last command executed.

To delay the execution for a specified amoutn of time
sleep 1 - delays for 1 second

To make a multiline comment inside .sh / bash file
#!/bin/bash
#Program that counts down to zero from a given argument

#!/bin/bash
#Program that counts down to zero from a given argument

echo -e "\n~~ Countdown Timer ~~\n"
if [[ $1 -gt 0 ]]
then
: '
  for (( i = $1; i >= 0; i-- ))
  do
    echo $i 
    sleep 1
  done
  '
  I=$1 
  while [[ $I -ge 0 ]]
  do
    echo $I
    (( I-- ))
    sleep 1
  done
else
  echo Include a positive integer as the first argument.
fi
help while 
while: while COMMANDS; do COMMANDS; done
    Execute commands as long as a test succeeds.
    
    Expand and execute COMMANDS as long as the final command in the
    `while' COMMANDS has an exit status of zero.
    
    Exit Status:
    Returns the status of the last command executed.

arithmetic operations
The value we set or initialized for I is 1 but if we want to make a mathematical operation with a certain expression, it will
display a different value but if we display I once again it will revert back to its original value which is 1.
Better to save it in another variable.

All executed in terminal not inside a .sh / bash file
I=1

echo $(( I + 5))
returns: 6

echo $I
returns: 1

J=$((I + 3))
echo $J
returns: 4

(( ... )) will perform a calculation or operation
$(( ... )) will replace the calculation with the result of it

To provide a comprehensive list of all variables along with their properties declared in terminal not in .sh / bash file
declare -p 
declare -p J
returns:
declare -- J="4"

(( )) VS [[ ]]
(( )) - does not need to use a dollar sign to call the variable, simply call the variable
- can use mathematical operators such as <, >, =, !=, and many more
- use help let to see more info
[[ ]] - have to call the variable with dollar sign at the beginning of the variable
- use help test to see more info 
- uses mathematical operators such as -gt, lt, -eq, -ne, and many more

#!/bin/bash

# Bingo Number Generator

echo -e "\n~~ Bingo Number Generator ~~\n"

NUMBER=$(( RANDOM % 75 + 1 ))
TEXT="The next number is, "

if (( NUMBER <= 15 )) 
then
  echo $TEXT B:$NUMBER
elif [[ $NUMBER -le 30 ]]
then
  echo $TEXT I:$NUMBER
elif (( NUMBER < 46 ))
then
  echo $TEXT N:$NUMBER
elif [[ $NUMBER -lt 61 ]]
then
  echo $TEXT G:$NUMBER
else
  echo $TEXT O:$NUMBER
fi

To create an array, enclosed them with parentheses and separate the values with space
ARR=("apple" "orange" "banana")

To access the element inside an array
echo ${ARR[1]}
returns: 
orange

To display the array
echo ${ARR[*]} / echo ${ARR[@]}

To display the attributes and value of the variable ARR
declare -p ARR
returns: 
declare -a ARR=([0]="apple" [1]="orange" [2]="banana")


help function
function: function name { COMMANDS ; } or name () { COMMANDS ; }
    Define shell function.
    
    Create a shell function named NAME.  When invoked as a simple command,
    NAME runs COMMANDs in the calling shell's context.  When NAME is invoked,
    the arguments are passed to the function as $1...$n, and the function's
    name is in $FUNCNAME.
    
    Exit Status:
    Returns success unless NAME is readonly.

To create a function inside .sh / bash file
FUNCTION_NAME() {}

To call a function inside .sh / bash file
FUNCTION_NAME() {}

String pattern matching with bash / Regex 
=~
[[ hello =~ el ]]; echo $?
returns :
0 (since hello contains el)

[[ "hello world" =~ "lo wor" ]]; echo $?
returns:
0 (since hello world contains lo wor in the same exact order and spacing)

[[ "hello world" =~ ^h ]]; echo $?
returns:
0 (since hello world starts with h)

[[ "hello world" =~ ^h.+d$ ]]; echo $?
returns:
0 (since hello world starts with h, has at least one character after it, and ends with a d

[[ "hello world" =~ \?$ ]]; echo $?
returns:
1 (since hello world does not end with ?)

#!/bin/bash

# Program to tell a persons fortune

echo -e "\n~~ Fortune Teller ~~\n"

RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
N=$(( RANDOM % 6 ))

GET_FORTUNE() {
  if [[ ! $1 ]] # checks if f the first argument is empty or not (first scenario basis, it will execute the then command
  then
    echo Ask a yes or no question:
  else
    echo Try again. Make sure it ends with a question mark:
  fi
  read QUESTION 
}

GET_FORTUNE
until [[ $QUESTION =~ \?$ ]]
do
  GET_FORTUNE again
done

echo -e "\n${RESPONSES[$N]}"

To check the type of a bash command
type echo
returns:
echo is a shell builtin

type bash
returns:
bash is hashed (/user/bin/bash)
