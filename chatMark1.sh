#! /bin/bash

R='\033[0;31m'
G='\033[0;32m'
B='\033[0;36m'
Y='\033[0;33m'
NC='\033[0m'

#__________colors____________#

IP_FETCH=$(hostname -I | awk '{print $1}')

echo 'are you creating or joining a chat'
echo -e "1) host \n2) client \n3) quit"
read selected

case "$selected" in

    "host") 
        echo -e "${Y}\n--create chat--${NC}"
        read -p "enter a PORT to create a new session: " PORT_h

        if ! [[ "$PORT_h" =~ ^[0-9]+$ ]]
            then
                echo "sorry. use integers only to create a valid port!"
                exit 1
        fi 

        echo "|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|"
        echo -e "\tconnected to port~ ${G}$PORT_h${NC} IP~ ${B}$IP_FETCH${NC}"

        dt=$(date)
        echo -e "${Y}\t$dt${NC}"
        mawk -W interactive '$0="HOST: "$0' | nc -v -l -p $PORT_h 
        ;;

    "client")
        echo -e "${Y}\n--join chat--${NC}"
        read -p "enter PORT to join a channel: " PORT_c
        read -p "enter the IP of HOST: " HOST_c
        echo "|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|"
        echo -e "\tconnected to port~ ${G}$PORT_c${NC} IP~ ${B}$IP_FETCH${NC}"
        
        dt=$(date)
        echo -e "\t${Y}$dt${NC}"
        mawk -W interactive '$0="CLIENT: "$0' |nc $HOST_c $PORT_c
        ;;

    "quit") 
            echo -e "${Y}\n--you have quit NetChat--${NC}"
            exit 1 
        ;;
esac


