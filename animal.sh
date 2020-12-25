#! /bin/bash
animalsDB="animals"
if [ ! -f $animalsDB ] 
then
err1=$(zenity --info --title="database not found " --text="database file not found.exiting. bye bye !" --width=300 --height=200);
echo $err1
exit
fi
 insertanimal()
 {
 name=""
 #name=$(zenity --entry --title="please enter ur animal name ");echo $name
 echo "please enter ur animal name "
 read name
 while ((1))
 do 
 if [[ $name != +([a-z]|[A-Z]) ]]
 then 
 echo "invalid format. name should contain only alphabets enter again : "
 read name 
 else
 break
 fi
 done
 age=""
 echo "please enter ur animal age "
 read age 
 while ((1))
 do 
 if [[ $age =~ ^[0-9{2}$ ]]
 then
 break
 else
 echo "invalid format. age should contain 2 digits 0 to 9 enter again : "
 read age 
 fi
 done 
 
animal= expr substr "$animal" 1 3 ":" expr substr "$animal" 4 3 ":" expr substr "$animal" 6 5
 
 
 }
