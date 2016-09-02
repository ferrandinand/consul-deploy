#/bin/bash

export DO_PAT=HERE YOUR DIGITAL OCEAN TOKEN
export SSH_FINGERPRINT=$(ssh-keygen -lf ~/.ssh/id_rsa.pub | awk '{print $2}')
export TF_LOG=1

echo "DO_PAT:" $DO_PAT
echo "SSH_FINGERPRINT:" $SSH_FINGERPRINT
