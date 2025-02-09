{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \{\\rtf1\\ansi\\ansicpg1252\\cocoartf2821\
\\cocoatextscaling0\\cocoaplatform0\{\\fonttbl\\f0\\fswiss\\fcharset0 Helvetica;\}\
\{\\colortbl;\\red255\\green255\\blue255;\}\
\{\\*\\expandedcolortbl;;\}\
\\paperw11900\\paperh16840\\margl1440\\margr1440\\vieww11520\\viewh8400\\viewkind0\
\\pard\\tx720\\tx1440\\tx2160\\tx2880\\tx3600\\tx4320\\tx5040\\tx5760\\tx6480\\tx7200\\tx7920\\tx8640\\pardirnatural\\partightenfactor0\
\
\\f0\\fs24 \\cf0 #!/bin/bash\\\
\\\
# Define directory to scan\\\
SCAN_DIR="$HOME/Documents"\\\
LOG_FILE="$HOME/duplicate_files.log"\\\
\\\
# Create log file\\\
touch "$LOG_FILE"\\\
\\\
# Find and remove duplicates\\\
declare -A file_checksums\\\
\\\
find "$SCAN_DIR" -type f | while read -r file; do\\\
    checksum=$(md5 -q "$file")\\\
    if [[ -n "$\\\{file_checksums[$checksum]\\\}" ]]; then\\\
        echo "Duplicate found: $file (original: $\\\{file_checksums[$checksum]\\\})"\\\
        echo "Duplicate found: $file (original: $\\\{file_checksums[$checksum]\\\})" >> "$LOG_FILE"\\\
        read -p "Delete this duplicate? (y/n): " choice\\\
        if [[ "$choice" == "y" ]]; then\\\
            rm "$file"\\\
            echo "Deleted: $file" >> "$LOG_FILE"\\\
        fi\\\
    else\\\
        file_checksums["$checksum"]="$file"\\\
    fi\\\
done\\\
\\\
echo "Duplicate file scan completed. Check the log file at $LOG_FILE for details."\}}