#! /bin/bash 

GREP=/bin/grep


# this file contain a simple crud 

# create function
createUser()
{
  echo "Enter staff name"
  read name


  # data control : check if the username exist in the data base file 

  $GREP -i $name staffs

  if [ $? == 0 ];then
    echo "$name , is already exist "
  else 
    echo "enter a comment for $name"
    read comment
    while (( 1 ))
    do 
      echo "enter age of $name"
      read age
      if [[ $age =~ ^[0-9]{2}$ ]]; then 
        break
      else 
        echo "invalid format please enter an age between 10 and 99 , famech 3bed yfoutou 50 7assb salma"
      fi

    done
  fi
    echo "$name:$comment:$age" >> staffs
}

# READ function 
readUser()
{
  clear
  echo "which user you wanna print?"
  read pname
  str=$(grep -i $pname staffs)  
  IFS=':' # delimiter
  read -ra ADDR <<< "$str" # str is read into an array as tokens separated by IFS
  for i in "${ADDR[@]}"; do # access each element of array
    echo "$i"
done
}

# update user
updateUser()
{
  clear
  echo "which user u wanna modify"
  read moduser
  
  $GREP -i $moduser staffs 
  
  if [ $? == 0 ];then
    echo "user exist  would you like to modify : "
    echo "1) modifier valeur1"
    echo "2) modifier valeur2"
    read answer

    clear
    case "$answer" in 
      1) echo "enter comment : ";
      read comment
      str=$($GREP -i $moduser staffs)
      IFS=':' # delimiter
      read -ra ADDR <<< "$str" # str is read into an array as tokens separated by IFS
      for i in "${ADDR[@]}"; do # access each element of array
        echo "$i"
      done
      ;;
      #############################################
      ## Here some search about array manipulation ##### You can do it :)
      #############################################
      2) echo "modify age";;
      3) exit;;
    esac
  else
    echo "final test"
  fi

  }

# delete user
deleteUser()
{
  clear
  echo "which user would you like to delete !"
  read delUser

  $GREP -i $delUser staffs
  if [ $? == 0 ]
  then 
    echo "Are you sure you want to delete this username ? [Y/n]"
    read answer
    if [ $answer == "y" ]
      then 
        sed -i /$delUser/d  staffs
    fi
  else 
    echo "$delUser does not exist"
  fi
}

clear
# here the menu to test our functions 
echo "bienvenue demoiselle salma dans cette rebrique de test"
echo "1) create "
echo "2) read"
echo "3) update"
echo "4) delete"

read answer

case "$answer" in 
  1) createUser;;
  2) readUser;;
  3) updateUser;;
  4) deleteUser;;
  5)exit;;
esac
