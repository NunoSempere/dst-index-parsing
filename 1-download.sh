#!/bin/bash

# Base URL for download
baseUrl="https://wdc.kugi.kyoto-u.ac.jp/dst_final"

# Loop through years
year="$1"
for month in {01..12}; do

    # Assemble URL
    url="${baseUrl}/${year}${month}/index.html"

    # Define filename to save as
    # Example: index.html of December 2020 will be saved as 202012_index.html
    fileName="${year}${month}.html"

    # Use wget to download file
    wget -q "${url}" -O "downloads/${fileName}"

    # Check if download was successful to avoid empty files
    if [ $? -eq 0 ]; then
        echo "Successfully downloaded: ${fileName}"
    else
        echo "Failed to download or file does not exist: ${url}"
        rm -f "${outputDir}/${fileName}"  # Remove unsuccessfully downloaded or empty file
    fi
done

echo "Download completed."
