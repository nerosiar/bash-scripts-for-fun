#! /bin/bash
GREP=/bin/grep

name=$(zenity --entry --title="donnez le nom de l' animal que vous voulez modifier " --width=600 --height=700);
IFS=':'
str=$(grep -i $name animals)
if [ $? == 0 ]; 
then
read -ra ADDR <<< "$str"
 newname=$(zenity --entry --title="donnez le nouveau nom " --width=600 --height=700)
 while ((1))
 do
if [[ $newname != +([a-z]|[A-Z]) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="nom invalide s'il vous plait réessayer " --width=300 --height=200
          newname=$(zenity --entry --title="donnez le nouveau nom " --width=600 --height=700)
else
sed -i "s/$name/$newname/g" animals
break
fi
done
newage=$(zenity --entry --title="donnez le nouveau age " --width=600 --height=700)
 while ((1))
 do
 if [[ ! ( $newage =~ ^[0-9]{1,2}$) ]]; 
                then   
            zenity --warning --title="donnees invalide " --text="format invalide age doit etre entre 1 et 99" --width=300 --height=200
            newage=$(zenity --entry --title="donnez le nouveau age " --width=600 --height=700)
             else
sed -i "s/${ADDR[1]}/$newage/g" animals
break
fi
done 
newtype=$(zenity --entry --title="donnez le nouveau type" --width=600 --height=700)
 while ((1))
 do
 if [[ $type != +(["chat"]|["chien"]) ]];
                 then 
                  zenity --warning --title="donnees invalide " --text="type invalide s'il vous plait réessayer " --width=300 --height=200
                  type=$(zenity --entry --title="donnez le type de votre animal une autre fois" --width=300 --height=200)
                else
sed -i "s/${ADDR[2]}/$newtype/g" animals
break
fi
done
else 
zenity --info --text="animal n existe pas "
fi
./animal.sh



  
