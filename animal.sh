#! /bin/bash
animalsDB="animals"
if [ ! -f $animalsDB ] 
then
err1=$(zenity --info --title="database not found " --text="database file not found.exiting. bye bye !" --width=500 --height=500);
echo $err1
exit
fi
 
salma=$(zenity --list --title="qu'est ce que vous voulez faire en ce qui concernes les animaux ?" --radiolist --column "pick" --column "opinion" FALSE "ajout-animal" FALSE "affichage-info-animal" FALSE "modification-animal" FALSE "suppression-animal" FALSE "exit" --width=500 --height=500);
echo $salma

if [ $salma = "ajout-animal" ];
then 
./animal-ajout.sh
elif [ $salma = "affichage-info-animal" ];
then
./animal-aff.sh
elif [ $salma = "modification-animal" ];
then
./menu-modif-animal.sh 
elif [ $salma = "suppression-animal" ];
then
./animal-del.sh
elif [ $salma = "exit" ];
then
if zenity --question --title="confirmer la sortie " --text=" <span color=\"red\">etes vous sur de vouloir quitter ??</span>" --width=500 --height=500
then
./menu.sh
else 
./animal.sh
fi
else
err=$(zenity --info --title="choix invalide  " --text="s'il vous plait essayer encore   " --width=500 --height=500);
echo $err
./animal.sh
fi

