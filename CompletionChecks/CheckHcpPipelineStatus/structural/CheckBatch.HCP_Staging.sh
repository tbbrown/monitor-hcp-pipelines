#!/bin/bash

printf "Connectome DB Username: "
read userid

stty -echo
printf "Connectome DB Password: "
read password
echo ""
stty echo

project="HCP_Staging"

from_file=( $( cat ${project}.structural.subjects ) )
subjects="`echo "${from_file[@]}"`"

for subject in ${subjects} ; do

    python ../CheckHcpPipelineStatus.py \
        --verbose=true \
        -u ${userid} \
        -p ${password} \
        -pl structural \
        -pr ${project} \
        -o "${subject}.out" \
        -su "${subject}"

    more ${subject}.out 

done