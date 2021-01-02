#! /bin/bash
GREP=/bin/grep

ID=$(zenity --entry --title="donnez l ID du veterinaire : " --width=500 --height=500)
while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{9}$) ]]; 
        then
          zenity --warning --title="donnees invalide " --text="format invalide ID doit comporter 9 chiffres " --width=300 --height=200
ID=$(zenity --entry --title="2donnez l ID du veterinaire : " --width=500 --height=500)
  else   
str=$(grep -i "^$ID" vetes)
if [ $? == 0 ]; 
then
    z1=$(zenity --info --title="verification de l existence de ce veterinaire " --text="ce veterinaire deja existe" --width=500 --height=500)
    if zenity --question --title="confirmer la sortie " --text=" <span color=\"red\">etes vous sur de vouloir quitter et ne pas reessayer  ??</span>" --width=500 --height=500
    then
        exit
    else
        ./vete-ajout.sh
    fi
else
    while ((1));
     do
  if [[ ! ( $ID =~ ^[0-9]{9}$) ]]; 
  then   
zenity --warning --title="donnees invalide " --text="format invalide ID doit comporter 9 chiffres " --width=300 --height=200
ID=$(zenity --entry --title="2donnez l ID du veterinaire : " --width=500 --height=500)
  else   
   name=$(zenity --entry --title="donnez le nom de veterinaire " --width=500 --height=500)  
   break
   fi
   done
   while ((1));
     do
     if [[ $name != +([a-z]|[A-Z]) ]]; 
        then
           zenity --warning --title="donnees invalide " --text="nom invalide s'il vous plait réessayer " --width=300 --height=200
            name=$(zenity --entry --title="2donnez le nom de veterinaire " --width=500 --height=500) 
        else
        prenom=$(zenity --entry --title="donnez le prennom de veterinaire " --width=500 --height=500)  
        break
        fi
        done
        while ((1))
               do
     if [[ $prenom != +([a-z]|[A-Z]) ]]; 
        then
            zenity --warning --title="donnees invalide " --text="prenom invalide s'il vous plait réessayer " --width=300 --height=200
            prenom=$(zenity --entry --title="2donnez le prennom de veterinaire " --width=500 --height=500)
        else
      tel=$(zenity --entry --title="donnez le num de tel de ce veterinaire  " --width=500 --height=500);
      break
      fi
      done
       while ((1))
               do
                if [[ ! ($tel =~ ^[0-9]{8}$) ]];
                 then 
          zenity --warning --title="donnees invalide " --text="num invalide s'il vous plait réessayer " --width=300 --height=200
           tel=$(zenity --entry --title="2donnez le num de tel de ce veterinaire  " --width=500 --height=500);
           else 
           echo "$ID:$name:$prenom:$tel" >>vetes
           ./vete.sh
               break
     fi
     done
     break
     fi
     fi
     done


