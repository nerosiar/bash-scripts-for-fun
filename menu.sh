#! /bin/bash

salma=$(zenity --list --title="qu'est ce que vous voulez faire ?" --radiolist --column "pick" --column "opinion" FALSE "gestion-animaux" FALSE "gestion-veterinaires" FALSE "rendez-vous" FALSE "exit" --width=300 --height=200);
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
if zenity --question --title="confirm exiting" --text=" <span color=\"red\">are you sure you want to exit ??</span>" --width=300 --height=200 
then
exit
else 
./menu.sh
fi
else
err=$(zenity --info --title="invalid choice " --text="please try again   " --width=300 --height=200 );
echo $err
./menu.sh
fi

