#!/bin/bash

TARGET=$1

echo "[+] Running SYN scan"
nmap -sS $TARGET

echo "[+] Running full port scan"
nmap -p- $TARGET

echo "[+] Running stealth scan"
nmap -sF $TARGET
