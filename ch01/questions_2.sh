#!/bin/sh

# Ask some questions and collect the answer

gdialog --title "Questionnaire" --msgbox "Welcome to my simple survey" 9 18

gdialog --title "Confirm" --yesno "Are you willing to take part?" 9 18

if [ $? != 0 ]
then
    gdialog --infobox "Thank you anyway" 5 20
    sleep 2
    gdialog --clear
    exit 0
fi

gdialog --title "Questionnaire" --inputbox "Please enter your name" 9 30 2> _1.txt
Q_NAME=$(cat _1.txt)

gdialog --menu "$Q_NAME, what music do you like best?" 15 30 4 1 "Classical" 2 "Jazz" 3 "Country" 4 "Other" 2> _1.txt
Q_MUSIC=$(cat _1.txt)

if [ "$Q_MUSIC" = "1" ]
then
    gdialog --title "Likes Classical" --msgbox "Good choice!" 12 25
else
    gdialog --title "Doesn't like Classical" --msgbox "Shame" 12 25
fi

sleep 2
gdialog --clear
exit 0

