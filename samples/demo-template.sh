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
#
# # hide the evidence
# clear
# DEMO_PROMPT='[\u@\h \W]\$ '
# cd /root/go/src/github.com/swatisehgal/sample-device-plugin/

# put your demo awesomeness here
# cd /root/go/src/github.com/paxtonhare/demo-magic/samples

# Demo for Sprint 186
# pe "cd /root/go/src/github.com/swatisehgal/topology-aware-scheduler-plugin"
# pe "kubectl get nodes"
# p "# Sample device plugins are deployed"
# pe "kubectl get pods"
# pe "kubectl get node kind-kubetest-control-plane -o json | jq '.status.allocatable'"
# pe "kubectl get node kind-kubetest-worker -o json | jq '.status.allocatable'"
# p "# NodeResourceTopology CRD"
# pe "kubectl get crd"
# pe "kubectl get noderesourcetopologies"
# pe "kubectl describe noderesourcetopologies kind-kubetest-control-plane"
# pe "kubectl describe noderesourcetopologies kind-kubetest-worker"
# pe "kubectl get pods -n kube-system"
# p "# Deploying Topology Aware Scheduler plugin"
# pe "make deploy"
# pe "kubectl get pods -n kube-system"
# pe "kubectl get pods"
# p "# Deploying pods requesting resources; scheduled by the new plugin"
# pe "cat manifests/test-deployment.yaml"
# pe "kubectl create -f manifests/test-deployment.yaml"
# pe "kubectl get pods -o wide"
# pe "cat manifests/test-deployment-2.yaml"
# pe "kubectl create -f manifests/test-deployment-2.yaml"
# pe "kubectl get pods -o wide"


# Sprint Demo 187
# Show nodes in the cluster
# Openshift version
#  pe "cd /root/go/src/github.com/swatisehgal/resource-topology-exporter"
# p "# Nodes in the Openshift cluster"
# pe "oc get nodes"
# # Show device plugins
# p "# SR-IOV network operator has been already deployed on this cluster"
# pe "oc get node cnfd0-worker-0.fci1.kni.lab.eng.bos.redhat.com -o json | jq '.status.allocatable'"
# pe "oc get node cnfd2-worker-0.fci1.kni.lab.eng.bos.redhat.com -o json | jq '.status.allocatable'"
# # Show running workloads
# p "# Workloads running in the RTE namespace"
# pe "oc get pods -o wide -n rte"
# pe "oc exec sample-pod -n rte -- env | grep PCIDEVICE_OPENSHIFT_IO_SRIOV"
# pe "oc exec sample-pod-2 -n rte -- env | grep PCIDEVICE_OPENSHIFT_IO_SRIOV"
# pe "oc exec sample-pod-3 -n rte -- env | grep PCIDEVICE_OPENSHIFT_IO_SRIOV"
# # Show noderesourcetopologies crd
# p "# NodeResourceTopology CRD"
# pe "oc get crd | grep noderesourcetopologies"
# pe "oc get noderesourcetopologies"
# # Deploy RTE
# pe "make deploy"
# # Will wait until user presses enter
# PROMPT_TIMEOUT=2
# wait
# # Show RTE running
# pe "oc get pods -o wide"
# # Show noderesourcetopologies crds for both the nodes
# pe "oc get noderesourcetopologies"
# pe "oc describe noderesourcetopologies cnfd0-worker-0.fci1.kni.lab.eng.bos.redhat.com"
# pe "oc describe noderesourcetopologies cnfd2-worker-0.fci1.kni.lab.eng.bos.redhat.com"
# # Deploy custom scheduler
# p "# Deploying Topology Aware Scheduler"
# pe "oc get pods -n kube-system"
# pe "cd /root/go/src/k8s.io/kubernetes-topo-aware-scheduler/my-sched"
# pe "make deploy"
# # Will wait until user presses enter
# PROMPT_TIMEOUT=4
# wait
# pe "oc get pods -n kube-system"
# # Run workload using this new scheduler
# p "# Deploying pods requesting resources; scheduled by the Topology aware scheduler (my-scheduler)"
# pe "cat manifests/test-pod.yaml"
# pe "make deploy-pod"
# # Will wait until user presses enter
# PROMPT_TIMEOUT=4
# wait
# pe "oc get pods -o wide -n rte"
# p "# As can be seen the pod is scheduled on cnfd0-worker"
# pe "oc exec sample-pod-2 -n rte -- env | grep PCIDEVICE_OPENSHIFT_IO_SRIOV"

# Kubectl version
pe "cd /root/go/src/github.com/kubernetes-sigs/node-feature-discovery"
p "# Nodes in the Kubernetes cluster"
pe "kubectl get nodes"
# Show device plugins
p "# Device Plugins (deviceA and deviceB) have been deployed on this cluster"
pe "kubectl get node kind-control-plane  -o json | jq '.status.allocatable'"
pe "kubectl get node kind-worker -o json | jq '.status.allocatable'"
# Show running workloads
p "# Workloads running in the RTE namespace"
pe "kubectl get pods -o wide -n rte"
pe "kubectl logs test-deployment-1-77885667bc-h2wk4 -n rte"
pe "kubectl logs test-deployment-2-868ff7fdf4-kzfsq -n rte"
# Show noderesourcetopologies crd
p "# NodeResourceTopology CRD"
pe "kubectl get crd"
pe "kubectl get noderesourcetopologies"
p "# Node feature Discovery Daemonset"
pe "cat nfd-daemonset-master-topologyupdater-combined.yaml"
# Deploy NFD
pe "kubectl create -f nfd-daemonset-master-topologyupdater-combined.yaml"
pe " kubectl get pods -n node-feature-discovery -o wide"
# Show noderesourcetopologies crds for both the nodes
pe "kubectl get noderesourcetopologies"
pe "kubectl describe noderesourcetopologies kind-control-plane"
pe "kubectl describe noderesourcetopologies kind-worker"
# # Deploy custom scheduler
# p "# Deploying Topology Aware Scheduler"
# pe "kubectl get pods -n kube-system"
# pe "cd /root/go/src/k8s.io/my-sched"
# pe "make deploy"
# # Will wait until user presses enter
# PROMPT_TIMEOUT=4
# wait
# pe "kubectl get pods -n kube-system"
# # Run workload using this new scheduler
# p "# Deploying pods requesting resources; scheduled by the Topology aware scheduler (my-scheduler)"
# pe "cat manifests/topology.k8s.io/testpod.yaml"
# pe "make deploy-pod"
# # Will wait until user presses enter
# PROMPT_TIMEOUT=4
# wait
# pe "kubectl get pods -o wide  "
# p "# As can be seen the pod is scheduled on cnfd0-worker"


# cleanup
# /root/go/src/github.com/swatisehgal/resource-topology-exporter
# make clean
# oc delete noderesourcetopologies --all
# /root/go/src/k8s.io/kubernetes-topo-aware-scheduler/my-sched
# make clean


# PROMPT_TIMEOUT=0
# wait
#
#
#
# pe "ls"
#
# p "cat \"something you dont want to really run\""
#
# # show a prompt so as not to reveal our true nature after
# # the demo has concluded
# p ""
