#!/bin/bash

for arg in "$@"
do
    case $arg in
        -tlip=*|--target-local-ip=*)
        TLIP="${arg#*=}"
        shift
        ;;
        *)
        echo "Unknown option: $arg"
        exit 1
        ;;
    esac
done

CURRENT_DATE=$(date +"%d-%m-%Y-%H.%M.%S.$(echo "$(date +%s.%N) * 1000 / 1" | bc | sed 's/.*\(...\)/\1/')__$(date +%s)$(echo "$(date +%s.%N) * 1000 / 1" | bc | sed 's/.*\(...\)/\1/')") # perfect

OUTPUT_DIR="$PWD/out/$CURRENT_DATE/$TLIP"

if [ ! -d "$OUTPUT_DIR" ]
then
    mkdir -p "$OUTPUT_DIR"
fi

ip_addresses=$(nmap -sn $TLIP | grep 'Nmap scan report for' | awk '{gsub(/[()]/,"",$NF); print $NF}')

for ip_address in $ip_addresses
do
    file_path="$OUTPUT_DIR/nmap_output_$ip_address.txt"
    
    count=1
    while [ -f "$file_path" ]
    do
        file_path="$OUTPUT_DIR/nmap_output_$ip_address($count).txt"
        ((count++))
    done
    
    nmap -v -A "$ip_address" > "$file_path"
    
    echo "nmap output for $ip_address written to file $file_path"
done
