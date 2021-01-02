#! /bin/bash

salma=$(zenity --list --title="qu'est ce que vous voulez faire ?" --radiolist --column "pick" --column "opinion" FALSE "gestion-animaux" FALSE "gestion-veterinaires" FALSE "rendez-vous" FALSE "exit" --width=500 --height=500);
echo $salma


if [ $salma = "gestion-animaux" ];
then 
./animal.sh
elif [ $salma = "gestion-veterinaires" ];
then
./vete.sh
elif [ $salma = "rendez-vous" ];
then
./rendez-vous.sh
elif [ $salma = "exit" ];
then
if zenity --question --title="confirmer la sortie " --text=" <span color=\"red\">etes vous sur de vouloir quitter ??</span>" --width=300 --height=200 
then
exit
else 
./menu.sh
fi
else
err=$(zenity --info --title="choix invalide  " --text="s'il vous plait essayer encore   " --width=300 --height=200 );
echo $err
./menu.sh
fi

