#!/bin/bash
# =========================================
# parse-logs.sh [OPTION]... DIR
#    DIR - logs directory
# 
# 
# OPTIONS:
#    -l, --lines NUMBER            Limit, default is '10'
# 
#    -o, --order [up|down]         Returns the first `NUMBER` logs if is 'up', otherwise the last `NUMBER`.
#                                  Default is 'up'
# =========================================
i=1
lval=10
oval="up"
path=""
#get params
while [[ $i -lt $# ]]; do
   
    arg="${!i}"
    case "$arg" in
        -l|--lines)
            lval=$((i+1))
            lval=${!lval}
            ((i++))
            ;;

        -o|--order)
            oval=$((i+1))
            oval=${!oval}
            ((i++))
            ;;
        *)
            echo "Error: Unknown option '$arg'"
            exit 1
            ;;
    esac
    ((i++))
done
#get path
path="${!#}"
if [[ $# -eq 0 ]]; then
    echo "Error: No path specified"
    exit 1
elif [[ ! -d "$path" ]]; then
    echo "Error: Path '$path' is not a directory"
    exit 1
fi

format="^\[ (INFO|DEBUG|WARNING|ERROR) \]\s[0-3][0-9]:[01][0-9]:[0-9]{4}\s[0-9]+\s[a-zA-Z_]*$"

grep -rhE --include='*.log' "$format" "$path" |\
sort -nr -k 5,5 |\
if [[ "$oval" == "up" ]]; then head -n "$lval"; else tail -n "$lval"; fi

