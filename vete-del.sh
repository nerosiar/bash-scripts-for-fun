#! /bin/bash
GREP=/bin/grep

ID=$(zenity --entry --title="donnez l'ID de veterinaire  que vous voulez supprimer " --width=500 --height=500)
while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{9}$) ]]; 
        then
          zenity --warning --title="donnees invalide " --text="format invalide ID doit comporter 9 chiffres " --width=300 --height=200
ID=$(zenity --entry --title="2donnez l ID du veterinaire : " --width=500 --height=500)
  else   
$GREP -i "^$ID" vetes
if [ $? == 0 ]; 
then
 if zenity --question --title="confirmer la suppression  " --text=" <span color=\"red\"> etes vous sur de vouloir supprimer ce veterinaires ??</span>" --width=500 --height=500
then
sed -i /$ID/d vetes
fi
else
zenity --info --title="resultat de recherche " --text="cet veterinaires n'existe pas " --width=500 --height=500 
./vete.sh
fi
break
fi
done





