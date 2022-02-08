#! /bin/bash

#__________colors____________#
R='\033[0;31m'
G='\033[0;32m'
B='\033[0;36m'
Y='\033[0;33m'
NC='\033[0m'
#__________colors____________#

ipFetch=$(hostname -I | awk '{print $1}')

echo 'are you creating or joining a chat?'
echo -e "1) host \n2) client \n3) quit"
read selected

case "$selected" in

    "host") 
        echo -e "${Y}\n--create chat--${NC}"

        echo "|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|"
        echo -e "\tListening on port~ ${G}89${NC} IP~ ${B}$ipFetch${NC}"

        dt=$(date)
        echo -e "${Y}\t$dt${NC}"
        mawk -W interactive '$0="HOST: "$0' | nc -lnvp 89 -s $ipFetch
        # ncat -nv 192.168.1.107 89 
        ;;
    
    "client")
        echo -e "${Y}\n--join chat--${NC}"
        read -p "enter the IP of HOST: " hostIp
        echo "|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|"
        echo -e "\tconnected to port~ ${G}$portNum${NC} IP~ ${B}$ipFetch${NC}"
        
        dt=$(date)
        echo -e "\t${Y}$dt${NC}"
        mawk -W interactive '$0="CLIENT: "$0' | ncat -nv $hostIp 89
        ;;

    "quit") 
            echo -e "${Y}\n--you have quit NetChat--${NC}"
            exit 1 
        ;;
esac