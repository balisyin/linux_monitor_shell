#!/bin/bash
clear
if [[ $# -eq 0 ]]
then
#Viarable
reset_terminal=$(tput sgr0)
#OS type
        os=$(uname -o)
        echo -e "\e[1;35m" "OS type is:" $reset_terminal $os
#release version and name
        os_name=$(cat /etc/issue|grep CentOS)
        echo -e "\e[1;35m" "release version:" $reset_terminal $os_name
#Architectur
        architeture=$(uname -m)
        echo -e "\e[1;35m" "Architectur:" $reset_terminal $architeture
#Kernal Release
        kernelrelease=$(uname -r)
        echo -e "\e[1;35m" "Kernal Release:" $reset_terminal $kernelrelease
#hostname
        hostname=$(uname -n)
        echo -e "\e[1;35m" "hostname:" $reset_terminal $hostname
#Internal IP
        internalip=$(ifconfig |grep "inet addr"|awk '/Bcast/{print $2}')
        echo -e "\e[1;35m" "Internal IP:" $reset_terminal $internalip
#External IP
        externalip=$(curl -s http://ipecho.net/plain)
        echo -e "\e[1;35m" "External IP:" $reset_terminal $externalip
#DNS
        nameservers=$(cat /etc/resolv.conf |grep -E "\<nameserver[ ]+"|awk '{print $NF}')
        echo -e "\e[1;35m" "DNS:" $reset_terminal $nameservers
#DNS
#network connected or not
        ping -c 2 www.avaya.com &>/dev/null && echo "Internet connected" || echo "Internet no connected"
#Logged In Users
        who>/tmp/who
        cat /tmp/who
        rm -rf /tmp/who
###################################
        systemuse=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
        appuse=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cache=$2}/Buffers/{buffer=$2}END{print (total-free-cache-buffer)/1024}' /proc/meminfo)
        echo -e "\e[1;35m" "System usage:" $reset_terminal $systemuse
        echo -e "\e[1;35m" "App usage:" $reset_terminal $appuse
##############################################################################
        loadaverage=$(top -n 1 -b |grep "load average" |awk '{print $13,14,$15}')
        echo -e "\e[1;35m" "Load average:" $reset_terminal $loadaverage
###disk
        diskaverage=$(df -h| grep -vE "Filesystem|tmpfs" | awk '{print $1 " " $5}')
        echo -e "\e[1;35m" "Disk average:" $reset_terminal $diskaverage
fi

