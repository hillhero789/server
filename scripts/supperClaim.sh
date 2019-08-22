#!/bin/bash
((i=1))
echo "$i"
while :
do
    if [ ! -f "minted$i" ]
    then
        exit
    else
        while read prikey
        do
            prikey=${prikey:0:44}
            pubkey=$(/root/VFC-Core/vfc getpub $prikey)
            pubkey=${pubkey: 46:45}
            /root/VFC-Core/vfc $pubkey > tmpfile
            sed 's/ /\n/g' tmpfile > tmpfile1
            balance=$(sed -n '35p' tmpfile1)
            cond=$(echo "$balance>0.0" | bc)
            if [ "$cond"  -ge "0" ];then
                cmdStr='/root/VFC-Core/vfc '${pubkey}' 2BHwkqDeFNYfFEVxhb4uZMqhW5o9fbkRQoEyoz9s4p1JA '${balance}' '${prikey}
                echo $cmdStr
                sleep 3
                $cmdStr
            fi
        done  < minted$i
        echo "minted$i has been claimed" > claimedFilename
        ((i=i+1))
    fi
done
