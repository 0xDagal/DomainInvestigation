#/bin/bash

ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0;0m'
BOLD_PURPLE='\033[1;35m'
RED='\033[0;31m'

echo -e "${ORANGE}Analyse des sous-domaines en cours (Allez vous préparer du café)...${NC}"
sublist3r -d $1 -o subDomains > /dev/null
while read sousDomaine; do
    addrIP=$(dig $sousDomaine | grep SERVER | cut -d ' ' -f 3 | cut -d '#' -f 1)
    rDNS=$(nmap -sT $sousDomaine | grep rDNS)

    nmap -sT $sousDomaine | grep open > portOpen

    echo "$sousDomaine : $addrIP"
    echo -e "${BOLD_PURPLE}$rDNS${NC}"

    while read po; do
        service=$(echo $po | cut -d ' ' -f 3)
        state=$(echo $po | cut -d ' ' -f 2)
        port=$(echo $po | cut -d '/' -f 1)
        echo -e "${GREEN}O${NC} $port($service)"
    done < portOpen    

    echo -e "\n"
    
    nmap -sT $sousDomaine | grep closed > portClosed

    while read pc; do
        service=$(echo $pc | cut -d ' ' -f 3)
        state=$(echo $pc | cut -d ' ' -f 2)
        port=$(echo $pc | cut -d '/' -f 1)
        echo -e "${RED}X${NC} $port($service)"
    done < portClosed    
    echo -e "\n"
done < subDomains










# echo -e "${ORANGE}Analyse adresses des sous-domaines en cours...${NC}"
# dig -f subDomains | grep SERVER | cut -d ' ' -f 3 | cut -d '#' -f 1 > addrIPs
# cat addrIPs
# echo -e "${GREEN}Les adresses de ces sous-domaines sont repertoriés dans le fichier addrIPs${NC}"
# echo -e "${ORANGE}Analyses nmap correspondantes...${NC}"
# nmap -iL subDomains > ports
# cat ports
# echo -e "${GREEN}Les résultats sont situés dans le fichier ports${NC}"
