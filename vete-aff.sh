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
zenity --info --text "ID:"""${ADDR[0]}""" :nom: """${ADDR[1]}""" :prenom :"""${ADDR[2]}""" :tel :"""${ADDR[3]}"" --width=500 --height=500
else
zenity --info --text="veterinaire n existe pas " --width=500 --height=500
fi
./vete.sh
break
fi
done



