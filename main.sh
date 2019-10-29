#!/bin/bash

#|-------------------|
#|  NAME OF SCIRPT   |
#|-------------------|

clear
echo
echo
echo -e '\033[0;31m                   (                                  )'
echo -e '                  )\ ) (  (     (  (  (       (   ( /('
echo -e '                 (()/( )\ )(   ))\ )\))(   (  )(  )\())('
echo -e '                 /(_)((_(()\ /((_((_)()\  )\(()\((_)\ )\'
echo -e '                (_)\033[0;34m _|\033[0;31m(_)((_(_)) _(()((_)((_)((_| |(_((_)'
echo -e '\033[0;34m                 |  _|| |  _/ -_)\ V  V / _ |  _| / /(_-<'
echo -e '                 |_|  |_|_| \___| \_/\_/\___|_| |_\_\/__/'
echo
echo
echo

#|-------------------|
#|     Print Menù    |
#|-------------------|

sleep 0.8s
echo -e '\033[0;34m+\033[0;31m---------------------[\033[0;34m Menù fireworks 2019\033[0;31m ]----------------------\033[0;34m+'
sleep 0.5s
echo -e '\033[0;31m|\033[0;34m 0) Exit                                                          \033[0;31m|'
sleep 0.5s
echo -e '\033[0;31m|\033[0;34m 1) Manual                                                        \033[0;31m|'
sleep 0.5s
echo -e '\033[0;31m|\033[0;34m 2) Add new sites                                                 \033[0;31m|'
sleep 0.5s
echo -e '\033[0;31m|\033[0;34m 3) Run                                                           \033[0;31m|'
sleep 0.5s
echo -e '\033[0;31m|\033[0;34m 4) Empty iptables                                                \033[0;31m|'
sleep 0.5s
echo -e '\033[0;34m+\033[0;31m------------------------[\033[0;34mfireworks 2019\033[0;31m]--------------------------\033[0;34m+'
sleep 0.8s
read -p "Valore atteso: " input

#EXIT
if [[ "$input" -eq 0 ]] ; then
    exit 1
fi


if [ "$input" -eq "1" ]; then
    cat manual.txt
fi

#EXECUTION
if [ "$input" -eq "3" ]; then

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
#|    Extract ip     |
#|-------------------|

cat $file | cut -d' ' -f4 > file

#|-------------------|
#|     iptables      |
#|-------------------|

path=file
declare -a ip
ip=(`cat "$path"`)

for (( i = 0 ; i < 9 ; i++))
do
  sudo iptables -A OUTPUT -d ${ip[$i]} -j DROP
  if [ "$?" -eq "0" ]; then
    echo -e "This ip: \033[0;31m${ip[$i]} \033[0;34mhas been added to iptables"
  fi
done

fi

#EMPTY IPTABLES
if [ "$input" -eq "4" ]; then
    #Line includes 2 rows of text
    line=sudo iptables --line-numbers -L OUTPUT | wc -l
    #Only rules
    rules=line-2
    for (( i = 0 ; i < $rules ; i++))
    do
       sudo iptables -D OUTPUT 1
    done
fi
