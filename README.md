# scripts
## Subdomain Enumeration (subdomains.sh)
### prerequisites
- [Chaos CLI](https://github.com/projectdiscovery/chaos-client)
- [Chaos API key](https://docs.google.com/forms/d/e/1FAIpQLSft7VfJhECT1nAPeW6a-3Uoeq8M6pymVa9eF3Q-1bCm6FaVFg/viewform)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [subfinder](https://github.com/projectdiscovery/subfinder)
- [amass](https://github.com/OWASP/Amass/)
- [findomain](https://github.com/Findomain/Findomain)
- [CTFR](https://github.com/UnaPibaGeek/ctfr)
- [gau](https://github.com/lc/gau)
- [waybackurls](https://github.com/tomnomnom/waybackurls)
- [unfurl](https://github.com/tomnomnom/unfurl)

### Steps
1) install all the tools mentioned above.

2) replace `<chaos_api_key>` with your [api key](https://docs.google.com/forms/d/e/1FAIpQLSft7VfJhECT1nAPeW6a-3Uoeq8M6pymVa9eF3Q-1bCm6FaVFg/viewform).

3) edit the installation directory for [CTFR](https://github.com/UnaPibaGeek/ctfr) in the script.

### Example
```bash
./subdomain.sh
enter domain
github.com
```
subdomains/subdomains.txt will contain all the enumerated subdomains.

### TODO
[ ] Make a script to install all the prerequisites.
