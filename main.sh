#!/bin/bash

#|-------------------|
#|   Initialization  |
#|-------------------|

file=blacklist

#|-------------------|
#| Pornographic Site |
#|-------------------|

#D
host -t a drtuber.com > $file
#J
host -t a keezmovies.com >> $file
#P
host -t a pornhub.com >> $file
#R
host -t a redtube.com >> $file
#S
host -t a scopateitaliane.com >> $file
host -t a spankwire.com >> $file
#T
host -t a tube8.com >> $file
host -t a xhamster.com >> $file
host -t a XNXX.com >> $file
host -t a xVideos.com >> $file
host -t a youporn.com >> $file
host -t a youjizz.com >> $file

#|-------------------|
#|   Social Network  |
#|-------------------|

#F
host -t a facebook.com >> $file
host -t a facebook.fr >> $file
host -t a facebook.it >> $file
#T
host -t a telegram.com >> $file
host -t a twitter.com >> $file
host -t a twitter.fr >> $file
host -t a twitter.it >> $file


#|-------------------|
#|        ...        |
#|-------------------|

cat $file | cut -d' ' -f4 > file

#|-------------------|
#|     iptables      |
#|-------------------|

file=file
declare -a ip
ip=(`cat "$file"`)

for (( i = 0 ; i < 9 ; i++))
do
  sudo iptables -A OUTPUT -d ${ip[$i]}  -j DROP
  if [ "$?" -eq "0" ]; then
    echo "ip ${ip[$i]} inserito"
  fi
done

