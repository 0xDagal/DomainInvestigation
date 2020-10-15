# DomainInvestigation
A simple script to investigate the different subdomains of known domain

## About

This script is made by multiple GitHub users 
* [La-Kil](https://github.com/La-Kil)
* [Enotian](https://github.com/Enotian)
* [BlandineLemaire](https://github.com/BlandineLemaire)
## Dependencies

### Sublist3r

Need [Sublist3r](https://github.com/aboul3la/Sublist3r) please refer to it installation guide and needs

### NMap

#### Debian Based
```apt-get install nmap```

#### Fedora
```dnf install nmap```

#### Arch Based

```pacma -S nmap```

### Installation
```curl -LJO https://github.com/dagal-secdev/DomainInvestigation/blob/main/domainInvestigation.sh ```

```chmod +x domainInvestigation.sh [domainName] ```

### Usage

```./domainInvestigation.sh```

## Improvement incoming 
- [ ] Sublist3r bruteforce option
- [ ] Service version
- [ ] CVE scan
- [ ] Checking if CVEs are Metasploitable
