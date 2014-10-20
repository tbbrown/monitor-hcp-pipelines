#!/bin/bash

printf "Connectome DB Username: " 
read username

stty -echo
printf "Connectome DB Password: "
read password
echo ""
stty echo

printf "Subject ID: "
read subj

printf "Project: "
read project

python ../CheckHcpPipelineStatus.py \
    --verbose=True \
    -u ${username} \
    -p ${password} \
    -pl task \
    -pr "${project}" \
    -o "${subj}.out" \
    -su "${subj}"

more "${subj}.out"