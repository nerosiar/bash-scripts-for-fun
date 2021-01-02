#! /bin/bash

GREP=/bin/grep

ID=$(zenity --entry --title="donnez l'ID du veterinaire que vous voulez afficher ces infos " --width=500 --height=500)
while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{9}$) ]]; 
        then
          zenity --warning --title="donnees invalide " --text="format invalide ID doit comporter 9 chiffres " --width=300 --height=200
ID=$(zenity --entry --title="2donnez l ID du veterinaire : " --width=500 --height=500)
  else   
$GREP -i "^$ID" vetes
IFS=':'
str=$(grep -i "^$ID" vetes)
if [ $? == 0 ]; 
then
read -ra ADDR <<< "$str"
 newID=$(zenity --entry --title="donnez le nouveau ID " --width=500 --height=500);
 while ((1))
 do
if [[ $ID =~ ^[0-9]{9}$ ]]; 
     then 
     sed -i "s/$ID/$newID/g" vetes
     break
     else
     zenity --warning --title="donnees invalide " --text="format invalide ID doit comporter 3 chiffres " --width=300 --height=200
    newID=$(zenity --entry --title="2donnez l ID du veterinaire : " --width=500 --height=500);
fi
done
else 
zenity --info --text="veterinaire n existe pas " --width=500 --height=500
fi
./menu-modif-vete.sh 
break
fi
done
