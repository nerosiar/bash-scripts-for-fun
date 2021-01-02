#! /bin/bash

GREP=/bin/grep

ID=$(zenity --entry --title="donnez l'ID de lanimal que vous voulez modifier " --width=500 --height=500)
while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{3}$) ]]; 
        then
          zenity --warning --title="donnees invalide " --text="format invalide ID doit comporter 3 chiffres " --width=300 --height=200
ID=$(zenity --entry --title="2donnez l ID d'animal : " --width=500 --height=500)
  else   
IFS=':'
str=$(grep -i "^$ID" animals)
if [ $? == 0 ]; 
then
read -ra ADDR <<< "$str"
 newage=$(zenity --entry --title="donnez le nouveau age" --width=500 --height=500);
 while ((1))
 do
if [[ $newage =~ ^[0-9]{1,2}$ ]]; 
     then 
     sed -i "s/${ADDR[2]}/$newage/g" animals
     else
     zenity --warning --title="donnees invalide " --text="format invalide age doit comporter 1 ou 2 chiffres " --width=300 --height=200
    newage=$(zenity --entry --title="2donnez le nouveau age : " --width=500 --height=500);
         break
fi
done
else 
zenity --info --text="animal n existe pas " --width=500 --height=500
fi
./menu-modif-animal.sh 
break
fi
done

