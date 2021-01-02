#! /bin/bash

salma=$(zenity --list --title="qu'est ce que vous voulez faire en ce qui concerne cet  animal ?" --radiolist --column "pick" --column "opinion" FALSE "change-name" FALSE "change-age" FALSE "change-type" FALSE "change-nomproprietaire" FALSE "exit" --width=500 --height=500);
if [ $salma = "change-name" ];
then 
./animal-chname.sh
elif [ $salma = "change-age" ];
then
./animal-chage.sh
elif [ $salma = "change-type" ];
then
./animal-chtype.sh 
elif [ $salma = "change-nomproprietaire" ]
then
./animal-chnameprop.sh
elif [ $salma = "exit" ];
then
if zenity --question --title="confirmer la sortie " --text=" <span color=\"red\">etes vous sur de vouloir quitter ??</span>" --width=500 --height=500
then
exit
else
./animal.sh
fi
else
err=$(zenity --info --title="choix invalide  " --text="s'il vous plait essayer encore   " --width=500 --height=500 );
./menu-ajout-animal.sh
fi

