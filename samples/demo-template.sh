#!/usr/bin/env bash

########################
# include the magic
########################
. ../demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
# DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
# clear


# put your demo awesomeness here
pe "cd /home/swsehgal/go/src/github.com/openshift-kni/performance-addon-operators"
p "# Compiling the Performance Profile Creator"
pe "make create-performance-profile"
p "# Running the Performance Profile Creator to see the possible command line arguments available"
pe "./build/_output/bin/performance-profile-creator -h"
PROMPT_TIMEOUT=5
wait
p "# Running the Performance Profile Creator to create a profile"
pe "./build/_output/bin/performance-profile-creator --mcp-name=worker-cnf --reserved-cpu-count=20 --rt-kernel=true --split-reserved-cpus-across-numa=false --topology-manager-policy=single-numa-node --must-gather-dir-path testdata/must-gather/must-gather.local.directory --power-consumption-mode=ultra-low-latency > performace-profile.yaml"
PROMPT_TIMEOUT=5
wait
pe "cat performace-profile.yaml"
PROMPT_TIMEOUT=5
wait
p "# Running the Performance Profile Creator using wrapper script"
pe "./hack/run-perf-profile-creator.sh -t must-gather.tar.gz -- --mcp-name=worker-cnf --reserved-cpu-count=20 --rt-kernel=false --split-reserved-cpus-across-numa=true --topology-manager-policy=restricted  --power-consumption-mode=low-latency > performace-profile.yaml"
pe "cat performace-profile.yaml"