#!/bin/bash

declare -a texto

exec 10<&0

exec < $1

let count=0

while read linha; do
	texto[$count]=$linha
	echo $linha | sed "s/ /  /"
	((count++))
done

exec 0<&10 10<&-

###########################################

#!/bin/bash

#date +%F--%Hh

nomeBKP=~/bkp-$(date +%F--%Hh)

mkdir $nomeBKP
find -mmin -1441 -exec cp {} $nomeBKP \;

zip -r $nomeBKP $nomeBKP
mv $nomeBKP.zip .
#find -mmin -1441 -print | zip source -@
