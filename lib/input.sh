#!/bin/bash
#ввод данных

if [ "$USER" != "root" -a "$USER" != "rust" -a "$USER" != "albert" ]; then 
echo ">>>>>>>NO root. Exit<<<<<<" $CHEK
exit 1
fi

echo ">>>>Enter domain:" 
read DOMAIN

CHEK=`/usr/local/ispmgr/sbin/mgrctl -m ispmgr wwwdomain | grep -i name=$DOMAIN | cut -d\  -f1`

if [ "$CHEK" == "" ]; then echo ">>>>>>>NO domain. Exit<<<<<<" $CHEK; exit 1; fi

echo "DOMAIN found:" $CHEK

USERNAME=`/usr/local/ispmgr/sbin/mgrctl -m ispmgr wwwdomain.edit  elid=$DOMAIN | grep -i owner | cut -d\= -f2`
echo ">>>USERNAME:" $USERNAME

PATHNEW=`/usr/local/ispmgr/sbin/mgrctl -m ispmgr wwwdomain.edit  elid=$DOMAIN | grep -i docroot | cut -d\= -f2`
echo ">>>PATHNEW:" $PATHNEW

if [ "$PATHNEW" == "" ]; then  echo ">>>>>>>NO PATH. Exit<<<<<<" ; exit 1 ; fi

#PATHNEW="/var/www/$USERNAME/data/www/$DOMAIN"

#echo "New path: " $PATHNEW
#if [ ! -d "$PATHNEW" ]; then 
#echo ">>>>>>>NO username or domain. Exit<<<<<<" 
#exit 1
#fi

read -n 1 -p "????????????? All alright ????????????? (y/[a]): " AMSURE 
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2

