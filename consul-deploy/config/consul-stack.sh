#/bin/bash

#Digital Ocean credentials
source digitalocean.sh

#Terraform provision
terraform plan   -var "do_token=${DO_PAT}"   -var "pub_key=$HOME/.ssh/id_rsa.pub"   -var "pvt_key=$HOME/.ssh/id_rsa"   -var "ssh_fingerprint=$SSH_FINGERPRINT"
terraform apply   -var "do_token=${DO_PAT}"   -var "pub_key=$HOME/.ssh/id_rsa.pub"   -var "pvt_key=$HOME/.ssh/id_rsa"   -var "ssh_fingerprint=$SSH_FINGERPRINT"

echo $(terraform output address_consul2)

#Get terraform droplet IP
export DO_IP=$(terraform output address_consul2)

##Ansible inventory
rm -rf ansible/consul.yml
cat << EOF >> ansible/consul.yml
[docker-consul]
$DO_IP
EOF

#Excute docker
ansible-playbook -vv -i ansible/consul.yml -u root ansible/playbook.yml
ansible-playbook -vv -i ansible/consul.yml -u root  ansible/3consul-containers.yml


#Insert some key-value
curl http://$DO_IP/v1/kv/?recurse
curl -X PUT -d 'test' http://$DO_IP/v1/kv/web/key2?flags=42
#curl -X DELETE http://l/v1/kv/web/sub?recurse
curl -X PUT -d 'newval' http://$DO_IP/v1/kv/web/key1?cas=97




