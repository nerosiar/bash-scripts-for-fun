#! /bin/bash
mdp=$(zenity --password --title="accés administratives " --timeout=10 --width=600 --height=700 );
if [ $mdp = "salma2000" ]
then
./menu.sh 
else
if (zenity --question --title="confirm entry" --text="mot de passe incorecte voulez vous réessayer ? " --width=500 --height=400);
then
./mdp.sh
else 
exit 
fi
fi

