#! /bin/bash

GREP=/bin/grep

ID=$(zenity --entry --title="donnez l'ID de votre animal" --width=500 --height=500)
while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{3}$) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="ID invalide s'il vous plait réessayer " --width=500 --height=500
            name=$(zenity --entry --title="donnez l'ID de votre animal une autre fois" --width=500 --height=500)
            else
            IFS=':'
str=$(grep -i "^$ID" animals )
if [ $? == 0 ]; 
then
read -ra ADDR <<< "$str"
zenity --info --text "ID:"""${ADDR[0]}""" /nom: """${ADDR[1]}""" /age :"""${ADDR[2]}""" /type :"""${ADDR[3]}""" /nom-proprietaire  :"""${ADDR[4]}"""" --width=400 --height=300
else
zenity --info --text="animal n existe pas " --width=500 --height=500
fi
./animal.sh
break
fi
done
