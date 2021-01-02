#! /bin/bash
rendDB="re-vo"
if [ ! -f $rendDB ] 
then
err1=$(zenity --info --title="database not found " --text="database file not found.exiting. bye bye !" --width=300 --height=200);
echo $err1
exit
fi
 
salma=$(zenity --list --title="qu'est ce que vous voulez faire en ce qui concernes les rendez-vous ?" --radiolist --column "pick" --column "opinion" FALSE "ajout-rendez-vous" FALSE "affichage-info-rendez-vous" FALSE "modification-rendez-vous" FALSE "suppression-rendez-vous" FALSE "exit" --width=300 --height=200);
echo $salma

if [ $salma = "ajout-rendez-vous" ];
then 
./rendez-vous-ajout.sh 
elif [ $salma = "affichage-info-rendez-vous" ];
then
./rendez-vous-aff.sh
elif [ $salma = "modification-rendez-vous" ];
then
./menu-modif-animal.sh 
elif [ $salma = "suppression-rendez-vous" ];
then
./animal-del.sh
elif [ $salma = "exit" ];
then
if zenity --question --title="confirmer la sortie " --text=" <span color=\"red\">etes vous sur de vouloir quitter ??</span>" --width=300 --height=200 
then
./menu.sh
else 
./animal.sh
fi
else
err=$(zenity --info --title="choix invalide  " --text="s'il vous plait essayer encore   " --width=300 --height=200 );
echo $err
./menu.sh
fi



