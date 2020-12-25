#! /bin/bash
vetesDB="vetes"
if [ ! -f $vetesDB ] 
then
err1=$(zenity --info --title="database not found " --text="database file not found.exiting. bye bye !" --width=300 --height=200);
echo $err1
exit
fi
