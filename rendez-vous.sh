#! /bin/bash

cal=$(zenity --calendar)
zenity --info --text="selected date: $cal" --width=300 --height=200 
echo $cal
