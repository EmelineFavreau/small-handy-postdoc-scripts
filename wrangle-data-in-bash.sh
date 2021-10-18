# Friday awk tip
# get the variable set in the loop to be accepted by awk, using single and double quotes
for species in $(cat ../species_list); do
	thisspecies="${species}"
	awk '$5 == "Terminal" { print $0}' orthogroups-analysis/Results_Aug12_1/Gene_Duplication_Events/Duplications.tsv | awk '$2 == "'$thisspecies'-longest-isoforms"' | cut -f 1 | sort | uniq > duplication-analysis/${species}_orthogroups_in_duplication_events
done

# Assess a large amount of files and check all are there
# for each orthogroup, check if the file exists, if not print the orthogroup
while read orthogroup; do
   test -f result/calculating-dnds/branch-model/${orthogroup} || echo $orthogroup
done < tmp/aligned-orthogroups


# Check many text files for the presence of a given string
# print files that do not have this stringI know some orthogroups have not finished their dnds 
grep -L "Time used" result/calculating-dnds/branch-model/${species}/M2-*
