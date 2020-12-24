#! /bin/bash 

# salma= $(zenity --list --title="Choose an option from the menu" --text="hello in our clinic" --column="start menu" "task1" "task2" "task3")

ans=$(zenity  --list  --text "change as you like ?" --radiolist  --column "Pick" --column "Opinion" TRUE Menu1 FALSE Menu2 FALSE "Menu3" FALSE "Menu4"); 
echo $ans

if [ $ans = "Menu1" ];then
  echo "you r in the first menu"
else
   echo "try again"
fi;

#zenity --color-selection --color red --show-palette