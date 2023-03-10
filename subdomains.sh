#!/bin/bash
echo "enter domain"
read domain
mkdir ~/Recon/$domain
cd ~/Recon/$domain
mkdir subdomains
cd subdomains
#Chaos
echo "starting chaos"
chaos -d $domain -key <chaos_api_key>  -o chaos.txt

#Assetfinder
echo  "Starting Assetfinder"
assetfinder --subs-only $domain |sort -u |tee assetfinder.txt

#subfinder
echo  "Starting subfinder"
subfinder -d $domain -all -o subfinder.txt

#amass
echo "Starting Amass"
amass enum -passive -norecursive -noalts -d $domain -o amass.txt

#CTFR
echo "Starting CTFR"
python3 ~/Tools/ctfr/ctfr.py -d $domain -o ctfr.txt

#crt.sh
curl -s "https://crt.sh/?q= $domain" | grep "<TD>" | grep  $domain | cut -d ">" -f2 | cut -d "<" -f1 | sort -u | sed '/^*/d' > crtsh.txt

#rapiddns
curl -s "https://rapiddns.io/subdomain/ $domain#result" | grep "<td><a" | cut -d '"' -f 2 | grep http | cut -d '/' -f3 | sort -u > rapid.txt

#bufferover
curl -s "https://dns.bufferover.run/dns?q=. $domain" | jq -r .FDNS_A[] | cut -d '\' -f2 | cut -d "," -f2 |  sort -u > bufferover.txt

#ridder
curl -s "https://riddler.io/search/exportcsv?q=pld: $domain" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u > ridder.txt

#jldc
curl -s "https://jldc.me/anubis/subdomains/ $domain" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | cut -d "/" -f3 > jldc.txt

#omnisint
curl -s "https://sonar.omnisint.io/subdomains/ $domain" | cut -d "[" -f1 | cut -d "]" -f1 | cut -d "\"" -f 2 > omnisint.txt

echo "starting gau and wayback"
#gau
echo $domain | gau | unfurl --unique domains > gau.txt

#waybackurls
echo $domain | waybackurls | unfurl --unique domains > wayback.txt
#Findomain
findomain -t $domain
#Flitering
echo "Starting Filtering"
cat * | sort -u | uniq -u | grep -v "*" | sort -u |tee subdomains.txt
