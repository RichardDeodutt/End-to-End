#!/bin/bash

#User to create
User='admin'

#Group for the user to join
Group='sudo'

#Shell for the user to use
Shell='/bin/bash'

#This is bad and I should find a beter way
#Password='url-shortener-deployment'
#Randomly Generate a Password

#SSH Key
SSHKey=''

#Logfile location
Date=$(echo `date +"%m-%d-%Y"`"_")
LogFile="/home/$User/"$Date"jenkinsdeployment.log"

#function to get a timestamp
timestamp(){
    #Two Different Date and Time Styles
    #echo $(date +"%m/%d/%Y %H:%M:%S %Z")
    printf "$(date +"%a %b %d %Y %I:%M:%S %p %Z")"
}

#function to log text with a timestamp to a logfile
log(){
    #First arugment is the text to log
    Text=$1
    printf "`timestamp` || $Text\n" >> $LogFile
}

#function to create a user
inituser(){
    #Add the user command
    useradd -m $User -g $Group -s $Shell
    #Change the password
    #echo "$User:$Password" | chpasswd

    #Log User Creation
    log "User Init"
}

#create ssh access for new user
initssh(){
    #Make the ssh directory
    mkdir -p "/home/$User/.ssh/"
    #Add the SSH key to the authorized_keys
    su $User -c "echo $SSHKey >> /home/$User/.ssh/authorized_keys"

    #Log SSH Creation
    log "SSH Init"
}

#create ssh access for new user by copying
initcopyssh(){
    #Make the ssh directory
    mkdir -p "/home/$User/.ssh/"
    #Copy the SSH key to the authorized_keys
    su $User -c "cat /home/ubuntu/.ssh/authorized_keys > /home/$User/.ssh/authorized_keys"

    #Log SSH Creation
    log "SSH Init"
}

initinstall(){
    #Install Git
    apt-get install git -y && log "Git is Installed"

    #Clone the Repo
    cd /root/ && git clone https://github.com/RichardDeodutt/End-to-End.git && mv /root/End-to-End /root/venv && cd - && log "Cloned Repo"

    #Change directory in to the cloned repo and run the install script and change directory back out
    cd /root/venv && /bin/bash install-url-shortener.sh && cd - && log "Ran 'install-url-shortener.sh'"

    #Log Jenkins Creation
    log "Url-Shortener Init"
}

initstatus(){
    #Install Screenfetch
    apt-get install screenfetch -y && log "Installed Screenfetch"
    #Log url-shortener Status
    log "\n$(systemctl status url-shortener --no-pager)"
    #Log Screenfetch
    log "\n$(screenfetch)"
}

#init everything
init(){
    #Init User
    inituser
    #Init SSH Use one or the other
    #initssh
    initcopyssh
    #Init url-shortener
    initinstall
    #Delay for 10 seconds for jenkins to load
    sleep 10
    #Init Status
    initstatus
}

#Init Everything
init