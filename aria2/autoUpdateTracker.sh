list=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -n "$list" ]; then
	if [ -z "`grep "bt-tracker" /aria2/aria2.conf`" ]; then
		sed -i '$a bt-tracker='${list} /aria2/aria2.conf
		echo add......
	else
		sed -i "s@bt-tracker.*@bt-tracker=$list@g" /aria2/aria2.conf
		echo update......
	fi
else
        echo "get empty tracker list, quit update"
fi
