#!/bin/bash

printf "Connectome DB Username: " 
read username

stty -echo
printf "Connectome DB Password: "
read password
echo ""
stty echo

subject_files_dir=~/subject_list_files
project="WU_L1B_Staging"
subject_file_name="${subject_files_dir}/${project}.task.subjects"
echo "Retrieving subject list from: ${subject_file_name}"
subject_list_from_file=( $( cat ${subject_file_name} ) )
subjects="`echo "${subject_list_from_file[@]}"`"

for subject in ${subjects} ; do
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo " Checking Task fMRI Analysis Processing completeness for subject: ${subject} in project: ${project}"
    echo "--------------------------------------------------------------------------------"
    echo ""

    python ../CheckHcpPipelineStatus.py \
        --verbose=True \
        -u ${username} \
        -p ${password} \
        -pl task \
        -pr ${project} \
        -o "${subject}.out" \
        -su "${subject}"

    more "${subject}.out"

done