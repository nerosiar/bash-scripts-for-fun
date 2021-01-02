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
str=$(grep -i "^$ID" animals )
if [ $? == 0 ]; 
then
    z1=$(zenity --info --title="verification ID" --text="cet animal deja existe" --width=500 --height=500)
    if zenity --question --title="confirmer la sortie " --text=" <span color=\"red\">etes vous sur de vouloir quitter et ne pas reessayer  ??</span>" --width=500 --height=500 
    then
       ./animal.sh
    else
        ./animal-ajout.sh
    fi
else
#ID=$(zenity --entry --title="donnez l'ID de l'animal que vous voulez " --width=500 --height=500)
  while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{3}$) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="ID invalide s'il vous plait réessayer " --width=500 --height=500
            ID=$(zenity --entry --title="donnez l'ID de votre animal" --width=500 --height=500)
            else
     name=$(zenity --entry --title="donnez le nom de votre animal" --width=500 --height=500)
     break
     fi 
     done
    while ((1));
     do
        if [[ $name != +([a-z]|[A-Z]) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="nom invalide s'il vous plait réessayer " --width=300 --height=200
            name=$(zenity --entry --title="donnez le nom de votre animal une autre fois" --width=500 --height=500)
        else
            age=$(zenity --entry --title="donnez l'age de votre animal " --width=500 --height=500)
            if [[ ! ( $age =~ ^[0-9]{1,2}$) ]]; 
                then   
            zenity --warning --title="donnees invalide " --text="format invalide age doit etre entre 1 et 99" --width=300 --height=200
             else
               type=$(zenity --entry --title="donnez le type de votre animal " --width=500 --height=500);
               break
               fi
               fi
               done
               while ((1))
               do
                if [[ $type != +(["chat"]|["chien"]) ]];
                 then 
                  zenity --warning --title="donnees invalide " --text="type invalide s'il vous plait réessayer " --width=300 --height=200
                  type=$(zenity --entry --title="donnez le type de votre animal une autre fois" --width=500 --height=500)
                else
                  nameprop=$(zenity --entry --title="donnez le nom de proprietrere de votre animal" --width=500 --height=500);
                  break
                  fi
                done
                 while ((1))
               do
                  if [[ $nameprop != +([a-z]|[A-Z]) ]]; 
                   then
            zenity --warning --title="donnees invalide " --text="nom invalide s'il vous plait réessayer " --width=500 --height=500
            nameprop=$(zenity --entry --title="donnez le nom de proprietrere de votre animal une autre fois" --width=500 --height=500);
                   else 
                   echo "$ID:$name:$age:$type:$nameprop" >>animals
                     break 
                   ./animal.sh
            fi 
            done 
            break
fi
fi
done
