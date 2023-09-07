#!/bin/bash
set -o nounset
set -o errexit

INPUT=${workingDirectory}/${output}/${TASK_AFTER}
OUTPUT=${workingDirectory}/${output}/${task_id}
FILES=$(ls -1 ${INPUT})

output_file="${OUTPUT}/stats.tsv"
colnames="Name\tSequence count\tMin. seq. length\tMax seq. length\tFile size (Kb)"
echo "${colnames}" > "${output_file}"

for file_name in ${FILES}
do
	file="${INPUT}/${file_name}"
	all_len=$(awk '/^>/{if (s) print length(s); print; s=""; next} {s=s $0} END{if(s)print length(s)}' "${file}")
	
	sequence_count=$(awk '/>/' "${file}" | wc -l)
	min_len=$(echo "${all_len}" | awk '!/>/' | sort -n | head -n 1)
	max_len=$(echo "${all_len}" | awk '!/>/' | sort -n | tail -n 1)
	file_size=$(stat --printf="%s" "${file}")
	file_size_kb=$(awk -v v1="${file_size}" -v v2=1000 'BEGIN {printf "%.2f", (v1/v2)}')
	
	line="${file_name}\t${sequence_count}\t${min_len}\t${max_len}\t${file_size_kb}" 
	echo "${line}" >> "${OUTPUT}/stats.tsv"
done