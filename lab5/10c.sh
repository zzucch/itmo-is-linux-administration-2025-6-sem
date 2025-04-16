#!/bin/bash

lower=~/overlay_/lower
upper=~/overlay_/upper
merged=~/overlay_/merged
audit_log=17_audit.log

true >"$audit_log"

find "$upper" -type c -o -name ".wh.*" | while read -r file; do
    echo "found: ${file}" >>"$audit_log"
done

cd "$lower" || exit
find . -type f -o -type d | while read -r file; do
    if [ "$file" != "." ]; then
        rel_path=${file#./}

        if [ ! -e "${merged}/${rel_path}" ]; then
            echo "merged missing: ${rel_path}" >>"$audit_log"
        elif [ -f "${lower}/${rel_path}" ] && [ -f "${merged}/${rel_path}" ]; then
            if ! cmp -s "${lower}/${rel_path}" "${merged}/${rel_path}"; then
                echo "diff: ${rel_path}" >>"$audit_log"
            fi
        fi
    fi
done
