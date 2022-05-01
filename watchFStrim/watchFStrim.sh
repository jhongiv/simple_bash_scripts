
PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
ofile=/home/jo0an/.log/fstrim/fstrim_watch.log
excluided1=`basename $0`		# per excloure el propi nom d'arxiu en la busqueda
excluided2=grep				# exclou al proces grep de la busqueda
excluided3=`basename $ofile`		# exclou al propi arxiu log
inici=`date +"%H:%M %d/%m/%Y"`
echo $excluided1
echo $excluided2
echo $excluided3
echo "Es desa la bitàcora a $ofile."

echo "Iniciant la busqueda de fstrim a les $inici" >> $ofile

while true; do
# Primer busca la cadena fstrim dins dels processos que /
# s'estan executan | i descarta valors exclosos que no interessen >> i escriu el log
	ps -eo pid,lstart,cmd | grep -i fstrim | grep -wv -e $excluided1 -e $excluided2 -e $excluided3 >> $ofile
#	sed -i '/watchFstrim.sh/d' $ofile
#	sed -i '/grep/d' $ofile
#	sed -i '/fstrim_watch.log/d' $ofile
	sleep 5
	trobat=`cat $ofile | wc -l`
#	if [ "$trobat" == 0 ]; then
#		echo "No trobat"
#	fi

done
