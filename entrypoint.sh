#!/bin/sh

# set -e

# # Extract the base64 encoded config data and write this to the KUBECONFIG
# mkdir -p /github/workspace/.kube
# echo $HOME
# pwd
# echo "running ls -a"
# ls -a
# cat .kube/config
# echo "running command ls .kube"
# ls .kube
# # echo "$KUBE_CONFIG_DATA" | base64 --decode > ${HOME}/.kube/config
# # export KUBECONFIG=github/home/runner/.kube/config

# # kubectl get nodes

# # cat .kube/config

# Extract the base64 encoded config data and write this to the KUBECONFIG



echo "RUNNING KUBE CONFIG FROM HOME: RUNNING cat ~/.kube/config "
cat ~/.kube/config
echo "RUNNING KUBE CONFIG FROM HOME: RUNNING {HOME}/.kube/config "
cat ${HOME}/.kube/config
echo "RUNNING KUBE CONFIG FROM HOME: RUNNING {val}/.kube/config "
val=$(pwd)
cat ${val}/.kube/config
echo "RUNNING KUBE CONFIG FROM HOME: RUNNING cat .kube/config "
cat .kube/config
echo "RUNNING KUBE CONFIG FROM HOME: RUNNING echo KUBE_CONFIG_DATA "
echo "$KUBE_CONFIG_DATA"


mkdir -p ${HOME}/.kube
echo "$KUBE_CONFIG_DATA" > ${HOME}/.kube/config
export KUBECONFIG=${HOME}/.kube/config

#Setup 
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
mkdir -p $HOME/go/src/github.com/uditgaurav
rsync -az --delete ${GOPATH}/src/github.com/uditgaurav/
cd ${GOPATH}/src/github.com/uditgaurav/
echo "RUNNING KUBE CONFIG FROM HOME: RUNNING pwd "
pwd
git clone https://github.com/uditgaurav/central-ci.git
cd central-ci

echo "running dependencies"
kubectl get nodes

# ##Install litmus if it is not already installed
# if [ $INSTALL_LITMUS = true ]
# then
#   go test tests/install-litmus_test.go -v -count=1
# fi

# ##Running the chaos experiment template
# go test tests/${EXPERIMENT_NAME}_test.go -v -count=1

# ##litmus cleanup
# if [ $LITMUS_CLEANUP = true ]
# then
#   go test tests/uninstall-litmus_test.go -v -count=1
# fi
