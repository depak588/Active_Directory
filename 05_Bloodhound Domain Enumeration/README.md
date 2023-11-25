
# Bloodhound Domain Enumeration

Download Kali linux and add as a base machine and make a clone of it and take a snapshot as a fresh install.


## Link

Download BloodHound from the repo given below and install it as per the documentation.

[BloodHound](https://github.com/BloodHoundAD/BloodHound)

Also download the BloodHound python version by 

```bash
  pip install bloodhound
```

First get the data of the workstation by

```bash
./bloodhound-python -u (username) -p (password) -dc (domain controller name) --disable-autogc -d (domain name) -c all
```
```bash
Ex: ./bloodhound-python -u bgill -p freedom -dc dc1.xyz.com --disable-autogc -c xyz.com
```

(Note: Run the help command to see the detailed explaination)

All the data will be saved in .json files upload the data into the BloodHound GUI and analyse it.