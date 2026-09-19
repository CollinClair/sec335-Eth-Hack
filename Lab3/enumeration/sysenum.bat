whoami /all >C:\temp\1_whoami.txt
tasklist > C:\temp\2_tasklist.txt
netstat -ano > C:\temp\3_netstat.txt
net start > C:\temp\4_services.txt
net user > c:\temp\5_users.txt
net localgroup > C:\temp\6_groups.txt
net localgroup Administrators > C:\temp\7_admins.txt
ipconfig /all > C:\temp\8_ipconfig.txt
netsh advfirewall show allprofiles > C:\temp\9_firewall.txt
arp -a > C:\temp\10_arp.txt
net session > C:\temp\11_sessions.txt
systeminfo > C:\temp\12_systeminfo.txt
qwinsta > C:\temp\13_qwinsta.txt
wmic qfe list > C:\temp\14_patches.txt
re query "HKLM\SYSTEM\CurrentControlSet\Services" > C:\temp\15_reg_services.txt
schtasks /query /fo LIST /v > C:\temp\16_schtasks.txt
net share > C:\temp\17_shares.txt
