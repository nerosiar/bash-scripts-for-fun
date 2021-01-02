#! /bin/bash
GREP=/bin/grep

ID=$(zenity --entry --title="donnez l'ID de votre animal" --width=500 --height=500)
while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{3}$) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="ID invalide s'il vous plait réessayer " --width=500 --height=500
            ID=$(zenity --entry --title="donnez l'ID de votre animal une autre fois" --width=500 --height=500)
            else
IFS=':'
str=$(grep -i "^$ID" animals )
if [ $? == 0 ]; 
then
read -ra ADDR <<< "$str"
 newname=$(zenity --entry --title="donnez le nouveau nom " --width=500 --height=500)
 while ((1))
 do
if [[ $newname != +([a-z]|[A-Z]) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="nom invalide s'il vous plait réessayer " --width=500 --height=500
          newname=$(zenity --entry --title="donnez le nouveau nom " --width=500 --height=500)
else
sed -i "s/${ADDR[4]}/$newname/g" animals
./menu-modif-animal.sh
break
fi
done
else 
zenity --info --text="animal n existe pas " --width=500 --height=500
fi
./menu-modif-animal.sh
break
fi
done
