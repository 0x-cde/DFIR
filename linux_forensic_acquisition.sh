#!/bin/bash

# Output file for the acquisition
output_file="forensics_acquisition_$(hostname)_$(date +"%Y_%m_%d_%H:%M").txt"

# Redirect the following information to the output file
{

    echo "1. Processes:"
    ps aux
    echo

    echo "2. Network Connections:"
    netstat -anp
    echo

    echo "3. Network Interfaces:"
    ip a
    echo

    echo "4. ARP Cache:"
    arp -a
    echo

    echo "5. DNS Cache (resolv.conf):"
    cat /etc/resolv.conf
    echo

    echo "6. Logged-in Users:"
    who
    echo

    echo "7. User Account Information:"
    cat /etc/passwd
    echo

    echo "8. Logged-in Sessions:"
    w
    echo

    echo "9. Open Files and Processes:"
    lsof
    echo

    echo "10. Kernel Information:"
    uname -a
    echo

    echo "11. Environment Variables:"
    env
    echo

    echo "12. System Configuration:"
    lshw
    lsblk
    lsusb
    echo

    echo "13. Recent Commands History:"
    history
    echo

    echo "14. Firewall Rules:"
    iptables -L -n
    echo
} > "$output_file"

echo "SHA256: " > "$output_file hashes".txt
sha256sum $output_file >> "$output_file hashes".txt
echo "SHA1:" >> "$output_file hashes".txt
sha1sum $output_file >> "$output_file hashes".txt
echo "MD5:" >> "$output_file hashes".txt
md5sum $output_file >> "$output_file hashes".txt

echo "Forensics acquisition completed. Output saved to $output_file."