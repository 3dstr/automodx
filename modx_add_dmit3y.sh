#!/bin/bash
#��� ��������� �� ����� �� ������� �������

echo "!!! NEW SITE FROM Dmi3y folder!!!!"

source ./lib/pass.sh  //���������� ����� �������
source ./lib/input.sh  //���������� ����

PATHOLD="./modx.evo.custom-master"
echo "Copy from :" $PATHOLD

echo "!---------------Coping to new----------------------!" 

find $PATHNEW" -type f -exec rm -rf {} \;

cp -R $PATHOLD/* $PATHNEW/
cp $PATHOLD/.htaccess $PATHNEW/

#cp ./lib/config.inc.php $PATHNEW/manager/includes/

echo "copy done!"


DB_DROP="0"

source ./lib/db_create_isp.sh  //�������� ����� ����

echo "---------------CHMOD -----------------------"

source ./lib/files_chmod.sh  //���������� ����

#source ./lib/update_config.sh  //������ � ����� ������� �������

source ./lib/print.sh  //����� ����

source ./lib/final_delete.sh  //�������� ������� ����� ���������

#source ./lib/db_set.sh  //������� ���������� � ����




