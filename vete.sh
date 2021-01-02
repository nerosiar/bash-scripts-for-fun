#! /bin/bash
vetesDB="vetes"
if [ ! -f $vetesDB ] 
then
err1=$(zenity --info --title="database not found " --text="database file not found.exiting. bye bye !" --width=500 --height=500);
exit
fi
salma=$(zenity --list --title="qu'est ce que vous voulez faire en ce qui concernes les veterinaires ?" --radiolist --column "pick" --column "opinion" FALSE "ajout-veterinaires" FALSE "affichage-info-veterinaires" FALSE "modification-veterinaires" FALSE "suppression-veterinaires" FALSE "exit" --width=500 --height=500);
echo $salma

if [ $salma = "ajout-veterinaires" ];
then 
./vete-ajout.sh
elif [ $salma = "affichage-info-veterinaires" ];
then
./vete-aff.sh
elif [ $salma = "modification-veterinaires" ];
then
./menu-modif-vete.sh 
elif [ $salma = "suppression-veterinaires" ];
then
./vete-del.sh
elif [ $salma = "exit" ];
then
if zenity --question --title="confirmer la sortie " --text=" <span color=\"red\">etes vous sur de vouloir quitter ??</span>" --width=500 --height=500
then
./menu.sh
else 
./vete.sh
fi
else
err=$(zenity --info --title="choix invalide  " --text="s'il vous plait essayer encore   " --width=500 --height=500 );
echo $err
./vete.sh
fi
