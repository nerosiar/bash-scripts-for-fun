#! /bin/bash 

# pick the database file 

animalsDB="animals"

# check file exist . if not leave program 
if [ ! -f $animalsDB ];then
  echo  "Database file not found. exiting. bye bye!"
  exit 
fi
