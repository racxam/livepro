#!/bin/bash

echo -e "This script will delete the existing build and create a new one\n"
rm -rf mta_archives
echo -e "Deleted mta_archive\n"
mbt build
echo -e "Created new mta_archive\n"

# Get the name of the newly created file
new_file=$(ls mta_archives | head -n 1)  # Adjust this if you expect multiple files
echo -e "Now Deploying ..........."

# Deploy using the newly created file
if [ -n "$new_file" ]; then
    cf deploy "mta_archives/$new_file"
    echo -e "Deployed mta_archives/$new_file\n..........................!!!!"
else
    echo -e "No files found in mta_archives to deploy.\n"
fi
