#!/bin/bash

which wget 1>/dev/null 2>/dev/null

if [[ $? -ne 0 ]]
then
        echo "Please install wget and re-try"
        exit 1
fi

if [[ -e "index.html" ]]
then
        echo "================"
        echo "Removing old index.html file"
        echo "================"
        rm -rf index.html
fi

url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
wget $url

if [[ $? -ne 0 ]]
then
        echo "Unable to download git info"
        exit 2
fi
declare -a git_vers
clear
echo -e "Searching for all available versions...\n"
while read line
do
        git_vers+=($(echo "$line" | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p' | cut -c 14- | awk -F '.tar.gz' '{print $1}'))
done < index.html

# echo "The all available git versions are: ${git_vers[*]}"

c=0
no_vers=${#git_vers[*]}
p=20
for each_vers in ${git_vers[*]}
do
#       echo -e "\t\t ${git_vers[$c]} \\t ${git_vers[(($c+1))]} ${git_vers[(($c+2))]}"
        printf "%-*s %-*s %-*s\n" $p ${git_vers[$c]} $p  ${git_vers[$((c+1))]} $p ${git_vers[$((c+2))]}
        c=$((c+3))

        if [[ $c -ge no_vers ]]
        then
                break
        fi
done