#! /bin/bash
GREP=/bin/grep
cal=$(zenity --calendar --date-format='%y-%m-%d');
current_date=$(date +'%y-%m-%d');
cal_int=$(date -d "${cal}" +"%s")
cd_int=$(date -d "${current_date}" +"%s")
#calcul d occurence de date 
h=$(grep -c -i "$cal" re-vo)
echo "$h"
