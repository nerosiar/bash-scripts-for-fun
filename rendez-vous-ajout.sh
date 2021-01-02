#! /bin/bash
cal=$(zenity --calendar --date-format='%y-%m-%d');
current_date=$(date +'%y-%m-%d');
cal_int=$(date -d "${cal}" +"%s")
cd_int=$(date -d "${current_date}" +"%s")
#calcul d occurence de date 
dcnt=$(grep -c -i "$cal" re-vo)
if  [[ "$cal_int"  -ge  "$cd_int" ]]
then 
if [ "$dcnt" = 0 ] 
then
h="8h"
echo "$cal:$h" >> re-vo
zenity --info --title="heure valide  " --text=" votre rendez vous est a 8h  " --width=300 --height=200
elif [ "$dcnt" -eq 1 ]
then  
h="10h"
echo "$cal:$h" >> re-vo 
zenity --info --title="heure valide  " --text=" votre rendez vous est a 10h  " --width=300 --height=200
elif [ "$dcnt" -eq 2 ] 
then 
h="14h"
echo "$cal:$h" >> re-vo 
zenity --info --title="heure valide  " --text=" votre rendez vous est a 14h  " --width=300 --height=200
elif [ "$dcnt" -eq 3 ] 
then 
h="16h"
echo "$cal:$h" >> re-vo
zenity --info --title="heure valide  " --text=" votre rendez vous est a 16h  " --width=300 --height=200 
else
zenity --info --title="jour complet " --text="dsl ce jour est complet choissisez un autre jour " --width=300 --height=200
if zenity --question --title="rendez-vous " --text=" vous voulez changer le jour  ??" --width=300 --height=200 
then
./rendez-vous.sh
else 
./menu.sh
fi
fi          
else 
if zenity --question --title="rendez-vous " --text=" date invalid !! vous voulez resaisir une autre date ??" --width=300 --height=200 
then
./rendez-vous.sh
else 
./menu.sh
fi
fi
