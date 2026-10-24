#!/bin/bash

mkdir -p /tmp/enumeration/

id> /tmp/enumeration/01_current_user.txt
ps aux > /tmp_enumeration/02_processes.txt
ss -tulnp > /tmp/enumeration/03_network_sockets.txt
systemctl list-unites --type=service > /tmp/enumeration/04_services.txt
cat /etc/passwd > /tmp/enumeration/05_local_users.txt
cat /etc/group > /tmp/enumeration/06_local_groups.txt
getent group sudo > /tmp/enumeration/07_sudo_group.txt
{ ip a; ip rout; cat /etc/resolv.conf; } > /tmp/enumeration/08_network_config.txt
sudo iptables > /tmp/enumeration/09_firewall.txt
ip neigh > /tmp/enumeration/10_arp_table.txt
sudo smbstatus > /tmp/enumeration/11_smb_sessions.txt
uname -a > /tmp/enumeration/12_system_info.txt
sudo -l > /tmp/enumeration/13_sudo_privileges.txt
w > /tmp/enumeration/14_logged_in_users.txt
cat ~/.bash_history > /tmp/enumeration/15_shell_history.txt
env > /tmp/enumeration/16_env_variables.txt
find / -perm -4000 -o 0perm -2000 2>/dev/null > /tmp/enumeration/17_suid_sgid.txt
getcap -r / 2>/dev/null > /tmp/enumeration/18_file_capabilities.txt
cat /etc/crontba && ls /etc/cron.d/ && systemctl list-timers --all > /tmp/enumeration/19_scheduled_tasks.txt
ps aux | grep -E ' falco|crowdstrike|sentinel|cylance|carbon|splunk|osquery|wazuh|aide' > /tmp/enumeration/20_security_tools.txt
dpkg -l > /tmp/enumeration/21_installed_packages.txt
uname -r && cat /proc/version > /tmp/enumeration/22_kernel_version.txt
df -h && mount > /tmp/enumeration/23_mounted_filesystems.txt
find / -name "authorized_keys" -o -name "id_rsa" -o -name "id_rsa.pub" 2>/dev/null > /tmp/enumeration/24_ssh_keys.txt && cat /etc/ssh/sshd_config >> /tmp/enumration/24_ssh_keys.txt
ls -la /etc/shadow > /tmp/enumeration/25_password_hashes.txt
sudo journalctl -u ssh --since "1 week ago" | grep -i "failed\|invalid" | tail -20 > /tmp/enumeration/26_auth_events.txt
docker ps 2>/dev/null > /tmp/enumeration/27_containers.txt && ls -la /var/run/docker.sock 2>/dev/null >> /tmp/enumeration/27_containers.txt
sestatus 2>/dev/null >> /tmp/enumeration/28_selinux_apparmor.txt && apparmor_status 2>/dev/null >> /tmp/enumeration/28_selinux_apparmor.txt
showmount -e localhost 2>/dev/null > /tmp/enumeration/29_nfs_shares.txt
hostname -f > /tmp/enumeration/30_hostname.txt && cat /etc/hosts >> /tmp/enumeration/30_hostname.txt
find /tmp /var/tmp /usr/share -perm -0002 -type f 2>/dev/null > /tmp/enumeration/31_world_writable.txt
sudo lsof -nP 2>/dev/null | grep deleted > /tmp/enumeration/32_open_files.txt
