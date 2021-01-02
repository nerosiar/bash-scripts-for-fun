#! /bin/bash
GREP=/bin/grep
date=$(zenity  --calendar --date-format='%y-%m-%d' --text="donnez le jour que vous voulez savoir combien de rendez-vous il comporte  ");
str=$(grep -i $date re-vo)
if [ $? == 0 ]; 
then
h=$(grep "$date" re-vo )
zenity --info --text "$h" --width=400 --height=400 
else
s=$(zenity --info --text="date n existe pas " --width=400 --height=400 );
fi
./rendez-vous.sh









