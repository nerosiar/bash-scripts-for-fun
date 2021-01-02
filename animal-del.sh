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
 if zenity --question --title="confirmer la suppression  " --text=" <span color=\"red\">etes vous sur de vouloir supprimer cet animal ??</span>" --width=500 --height=500
then
sed -i /$ID/d animals
./animal.sh
fi
else
zenity --info --title="resultat de recherche " --text="cet animal n'existe pas " --width=500 --height=500
./animal.sh
fi
break
fi
done
