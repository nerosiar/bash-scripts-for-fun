#! /bin/bash
cal=$(zenity --calendar --date-format='%y-%m-%d');
current_date=$(date +'%y-%m-%d');
cal_int=$(date -d "${cal}" +"%s")
cd_int=$(date -d "${current_date}" +"%s")
#calcul d occurence de date 
typeset -i dcnt=0
ddate=$cal
for dEach in `cat re-vo`
do
if [ "${dEach}" = "${ddate}" ]
then
dcnt=${dcnt}+1
echo $dcnt
fi
done
if  [[ "$cal_int"  -ge  "$cd_int" ]]
then 
case "$dcnt" in
0)h="8h"
echo "$cal:$h" >> re-vo
zenity --info --title="heure valide  " --text=" votre rendez vous est a 8h  " --width=300 --height=200
;;
1)h="10h"
echo "$cal:$h" >> re-vo 
zenity --info --title="heure valide  " --text=" votre rendez vous est a 10h  " --width=300 --height=200
;;
2)h="14h"
echo "$cal:$h" >> re-vo 
zenity --info --title="heure valide  " --text=" votre rendez vous est a 14h  " --width=300 --height=200
;;
3)h="16h"
echo "$cal:$h" >> re-vo 
zenity --info --title="heure valide  " --text=" votre rendez vous est a 16h  " --width=300 --height=200
#4) pf=$(zenity --info --title="jour complet " --text="dsl ce jour est complet choissisez un autre jour " --width=300 --height=200)
#if zenity --question --title="rendez-vous " --text=" vous voulez changer le jour  ??" --width=300 --height=200 
#then
#./rendez-vous.sh
#else 
#./menu.sh
#fi
#;;
esac           
else 
if zenity --question --title="rendez-vous " --text=" date invalid !! vous voulez resaisir une autre date ??" --width=300 --height=200 
then
./rendez-vous.sh
else 
./menu.sh
fi
fi

































