
PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
ofile=/home/jo0an/.log/fstrim/fstrim_watch.log

echo "Es desa la bitàcora a $ofile."

while true; do
	ps -eo pid,lstart,cmd | grep -i fstrim >> $ofile
	sed -i '/watchFstrim.sh/d' $ofile
	sed -i '/grep/d' $ofile
	sed -i '/fstrim_watch.log/d' $ofile
	sleep 5
	trobat=`cat $ofile | wc -l`
	if [ "$trobat" == 0 ]; then
		echo "No trobat"
	fi

done
