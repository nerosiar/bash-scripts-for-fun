#! /bin/bash

salma=$(zenity --list --title="qu'est ce que vous voulez changer  ?" --checklist --column "pick" --column "opinion" FALSE "change-nom " FALSE "change-prenom" FALSE "change-ID" FALSE "change-tel" FALSE "exit" --width=500 --height=500);

if [ $salma = "change-nom" ];
then 
./vete-chname.sh
elif [ $salma = "change-prenom" ];
then
./vete-chpre.sh
elif [ $salma = "change-ID" ];
then
./vete-chID.sh 
elif [ $salma = "change-tel" ];
then
./vete-chtel.sh 
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
./menu-ajout-vete.sh
fi

