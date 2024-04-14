Learn SQL by Building a Student Database: Part 1
MySQL
To truncate (delete the entries inside the table not the table itself) of one table
TRUNCATE tableName;

To truncate (delete the entries inside the table not the table itself) of three table
TRUNCATE table1Name, table2Name, table3Name;
sample
TRUNCATE courses, majors_courses
TRUNCATE majors, majors_courses, students

To truncate any tables that use column from it as a foreign key at the same time
TRUNCATE normalTable, hadForeignKeyWithNormalTable;

BASH
To save the 
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql

To check the files inside the project folder, use list command
ls 

To delete file inside the project folder
rm students_test.csv
To create a new file in Bash
touch insert_data.sh 

To grant permissions of the created file
chmod + x (for permission purposes)

To copy a file and then rename it to new file name
cp courses.csv courses_test.csv

To execute the comands declared inside the bash file
./insert_data.sh

Open the file created and add this comment
#!bin/bash

To access the external file (with different type from csv)
cat courses.csv 

It opens the file, while loops with a delimiter of comma and store the text being read in the variable MAJOR and COURSE, the echo is responsible for printing or displaying the retrieved values

cat courses.csv | while IFS="," read MAJOR COURSE
do
  echo $MAJOR $COURSE
done

Store the PSQL connection to a variable
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
-X prevents something to read which is the psql from reading the .psqlrc file at the startup
-no align means that the output is plain text and designed for easy reading in a console or file
-tuples-only instructs psql to only output tuples (rows), not the regular output headers or footers
-c means to run a single command or query then exit
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != first_name ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]] 
    then
      # set to null
      MAJOR_ID=null
    fi
    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES ('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    if [[ $INSERT_STUDENT_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into students, $FIRST $LAST
    fi
  fi
done

