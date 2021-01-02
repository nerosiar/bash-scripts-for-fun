#! /bin/bash
GREP=/bin/grep
ID=$(zenity --entry --title="donnez l'ID de votre animal" --width=500 --height=500)
while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{3}$) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="ID invalide s'il vous plait réessayer " --width=500 --height=500
            name=$(zenity --entry --title="donnez l'ID de votre animal une autre fois" --width=500 --height=500)
            else
IFS=':'
str=$(grep -i "^$ID" animals )
if [ $? == 0 ]; 
then
read -ra ADDR <<< "$str"
newtype=$(zenity --entry --title="donnez le nouveau type" --width=500 --height=500)
 while ((1))
 do
 if [[ $newtype != +(["chat"]|["chien"]) ]];
                 then 
                  zenity --warning --title="donnees invalide " --text="type invalide s'il vous plait réessayer " --width=500 --height=500
                  newtype=$(zenity --entry --title="donnez le type de votre animal une autre fois" --width=500 --height=500)
                else
sed -i "s/${ADDR[3]}/$newtype/g" animals
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
break
fi
done
