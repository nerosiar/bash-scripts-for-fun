#! /bin/bash 

# pick the database file 

animalsDB="animals"

# check file exist . if not leave program 
if [ ! -f $animalsDB ];then
  echo  "Database file not found. exiting. bye bye!"
  exit 
fi

# here the CRUD of the animals 

# create function
insertAnimal()
{
  # get some data 
  name=""
  echo "please enter ur animal name"
  read name 
  while (( 1 ))
  do 
    if [[ $name != ([a-z]|[A-Z]) ]]; then 
      echo  "Invalid format. name should comntain only alphabets   :"; read name
    elif 
      break
  done 
  

  age = ""
  echo "please enter the age of ur animal"
  read age
  while (( 1 ))
  do 
    if [[ $age =~ ^[0-9]{2}$) ]]; then 
      break
    elif 
      echo  "Invalid format. age should comntain 2 digits 0 to 9, enter again :"; read name
  done

  animal= expr substr "$animal" 1 3 ":" expr substr "$animal" 4 3 ":" expr substr "$animal" 6 5 
  

}