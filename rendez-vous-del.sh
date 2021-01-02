#! /bin/bash
GREP=/bin/grep
GREP=/bin/grep
date=$(zenity  --calendar --date-format='%y-%m-%d' --text="donnez le jour que vous voulez savoir combien de rendez-vous il comporte  ");
IFS=':'
str=$(grep -i $date re-vo)
if [ $? == 0 ]; 
then
read -ra ADDR <<< "$str"
h=$(zenity --entry --title="choix " --text=" <span color=\"red\"> le rendez-vous de quelle heure vous voulez suprimmer ??</span>" --width=600 --height=500 )
if [[ "$h" = "$ADDR[2]" ]]
then
sed -i /$date/d re-vo
else
zenity --info --title="resultat de recherche " --text="cet rendez-vous n'existe pas " --width=600 --height=500 
./rendez-vous.sh
fi
 fi





 
