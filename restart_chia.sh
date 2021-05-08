#!/bin/bash

# This program checks is chia is still connected and if not tries to restart it


currentDate=$(date)
test_case=$(cd ~/chia-blockchain && . ./activate && chia farm summary)


if echo $test_case | grep -q 'Farming status: Not synced or not connected to peers'; then
    echo "$currentDate: Restarting chia farmer" >> ~/chia_helpers/restart_chia.log
    cd ~/chia-blockchain && . ./activate && chia start -r farmer && sleep 60s && chia show -a 45.77.67.65:8444 >> ~/chia_helpers/restart_chia.log
fi

