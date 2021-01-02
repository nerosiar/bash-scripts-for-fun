#! /bin/bash
GREP=/bin/grep

name=$(zenity --entry --title="donnez le nom de votre animal" --width=300 --height=200)
$GREP -i $name animals
if [ $? == 0 ]; 
then
    z1=$(zenity --info --title="verification nom" --text="cet animal deja existe" --width=300 --height=200)
    if zenity --question --title="confirmer la sortie " --text=" <span color=\"red\">etes vous sur de vouloir quitter et ne pas reessayer  ??</span>" --width=300 --height=200; 
    then
        exit
    else
        ./animal-ajout.sh
    fi
else
    while ((1));
     do
        if [[ $name != +([a-z]|[A-Z]) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="nom invalide s'il vous plait réessayer " --width=300 --height=200
            name=$(zenity --entry --title="donnez le nom de votre animal une autre fois" --width=300 --height=200)
        else
            age=$(zenity --entry --title="donnez l'age de votre animal " --width=300 --height=200)
            if [[ ! ( $age =~ ^[0-9]{1,2}$) ]]; 
                then   
            zenity --warning --title="donnees invalide " --text="format invalide age doit etre entre 1 et 99" --width=300 --height=200
             else
               type=$(zenity --entry --title="donnez le type de votre animal " --width=300 --height=200);
               break
               fi
               fi
               done
               while ((1))
               do
                if [[ $type != +(["chat"]|["chien"]) ]];
                 then 
                  zenity --warning --title="donnees invalide " --text="type invalide s'il vous plait réessayer " --width=300 --height=200
                  type=$(zenity --entry --title="donnez le type de votre animal une autre fois" --width=300 --height=200)
                else
                  nameprop=$(zenity --entry --title="donnez le nom de proprietrere de votre animal" --width=300 --height=200);
                  if [[ $nameprop != +([a-z]|[A-Z]) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="nom invalide s'il vous plait réessayer " --width=300 --height=200
            nameprop=$(zenity --entry --title="donnez le nom de proprietrere de votre animal une autre fois" --width=300 --height=200);
                   else 
                   echo "$name:$age:$type:$nameprop" >>animals
                   break 
                fi
            fi 
            done 
fi









