# 🔎 Port Scan Detection Engineering Lab

## 🧭 Project Summary

This lab demonstrates how to detect network reconnaissance by analyzing multiple Nmap scan techniques and building SIEM detection logic with reduced false positives.

The project focuses on identifying abnormal port enumeration behavior typical of early-stage attackers.

---

## 🎯 Objectives

* Generate different Nmap scan types
* Capture network telemetry
* Build SIEM detection queries
* Reduce false positives
* Validate detection accuracy

---

## 🏗️ Lab Environment

* Kali Linux (attacker)
* Target host (Ubuntu)
* Splunk or ELK
* Network telemetry

---

## ⚔️ Attack Simulation

```bash
chmod +x scans/nmap_scans.sh
./scans/nmap_scans.sh <TARGET_IP>
```

Scans performed:

* SYN scan
* Full port scan
* FIN/stealth scan

---

## 🔍 Detection Strategy

### Key Indicators

* High number of unique destination ports
* Short time window enumeration
* Sequential probing patterns

### Example SPL

```spl
index=network
| stats dc(dest_port) as unique_ports by src_ip
| where unique_ports > 25
```

---

## 🚨 Alert Logic

* Threshold: >25 unique ports
* Time window: 5 minutes
* Severity: Medium

MITRE ATT&CK: T1046 – Network Service Discovery

---

## 📊 Expected Findings

* Clear port sweep patterns
* Reconnaissance fingerprints
* Reduced false positives after tuning

---

## 🔮 Future Improvements

* Scan type fingerprinting
* Rate-based detection
* ML anomaly scoring

---

## ⚠️ Disclaimer

For authorized lab use only.
