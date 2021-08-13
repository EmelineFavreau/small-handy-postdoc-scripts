# Friday awk tip
# get the variable set in the loop to be accepted by awk, using single and double quotes
for species in $(cat ../species_list); do
	thisspecies="${species}"
	awk '$5 == "Terminal" { print $0}' orthogroups-analysis/Results_Aug12_1/Gene_Duplication_Events/Duplications.tsv | awk '$2 == "'$thisspecies'-longest-isoforms"' | cut -f 1 | sort | uniq > duplication-analysis/${species}_orthogroups_in_duplication_events
done
