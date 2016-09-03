# consul-deploy

Consul-deploy is a simple app created to automate the deployment of some docker images in one Digital Ocean droplet to learn how Consul works:
- 3 Consul servers with UI listening
- Consul agent
- Registrator
- HA proxy 
- Rack app listenning in one port

# Prerequisites

- Digital Ocean token with enough credit to run a server.
- Terraform installed (https://www.terraform.io/downloads.html)
- Ansible installed (apt-get install ansible)

# Demo Motivations

Some days ago, I went to a devops meeting in which was explained how Consul works and how it is great dealing with containers getting along with registrator.
I was quite insterested in what was explained so I decided to play a little more with it but creating and destroying droplets and its provision was a pain in the neck.

# Running the app

1.- Modify consul-deploy/consul-deploy/config/digitalocean.sh and insert your Digital Ocean token linked with your user.ç

2.- Run consul-deploy/consul-deploy/config/consul-stack.sh to create the stack (Digital Ocean droplet - provision to run docker in the instances - run docker images)

3.- Access to the IP:5000 to aceess to consul user interface

4.- Run consul-deploy/consul-deploy/config/destroy-consul-stack.sh to remove all the images and the droplet
