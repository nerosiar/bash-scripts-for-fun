#! /bin/bash
GREP=/bin/grep


ID=$(zenity --entry --title="donnez l'ID du veterinaire que vous voulez afficher ces infos " --width=500 --height=500)
while ((1))
     do
        if [[ ! ( $ID =~ ^[0-9]{9}$) ]]; 
        then
          zenity --warning --title="donnees invalide " --text="format invalide ID doit comporter 9 chiffres " --width=300 --height=200
ID=$(zenity --entry --title="2donnez l ID du veterinaire : " --width=500 --height=500)
  else   
#$GREP -i "^$ID" vetes
IFS=':'
str=$(grep -i "^$ID" vetes)
if [ $? == 0 ]; 
then
read -ra ADDR <<< "$str"
newtel=$(zenity --entry --title="donnez le nouveau num de tel " --width=500 --height=500)
read -ra ADDR1 <<< "$newtel"
 while ((1))
 do
 if [[ ! ($newtel =~ ^[0-9]{8}$) ]]; 
                then   
            zenity --warning --title="donnees invalide " --text="format invalide num doit comporter 8 chiffres " --width=500 --height=500
            newtel=$(zenity --entry --title="donnez le nouveau num " --width=500 --height=500)
            else
sed -i "s/${ADDR[3]}/${ADDR1[0]}${ADDR1[1]}${ADDR1[2]}${ADDR1[3]}${ADDR1[4]}${ADDR1[5]}${ADDR1[6]}${ADDR1[7]}/g" vetes
break
fi
done 
else 
zenity --info --text="veterinaire n existe pas " --width=500 --height=500
fi
./menu-modif-vete.sh
break
fi
done
