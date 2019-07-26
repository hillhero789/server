#!/bin/bash
while read prikey
do
pubkey=$(/root/VFC-Core/vfc getpub $prikey)
pubkey=${pubkey: 46:45}
balance=$(/root/VFC-Core/vfc $pubkey)
balance=${balance: 196:5}
cmdStr='/root/VFC-Core/vfc '${pubkey}' 2BHwkqDeFNYfFEVxhb4uZMqhW5o9fbkRQoEyoz9s4p1JA '${balance}' '${prikey}
$cmdStr
sleep 3
done  < minted
echo 'Finish!'
echo 'Last sent tx:'${prikey}
