## Chef server Deployment tools

Manifests / modules to help the deploy of Chef server on CentOS 6 with either Ansible

## Background

The Chef server has the following prerequisites:

- An x86_64 compatible system architecture; Red Hat Enterprise Linux and CentOS may require updates prior to installation
- A resolvable hostname that is specified using a FQDN or an IP address
- A connection to NTP to prevent clock drift
- A local mail transfer agent that allows the Chef server to send email notifications
- Using cron and the /etc/cron.d directory for periodic maintenance tasks
- Disabling the Apache Qpid daemon on CentOS and Red Hat systems
- A local user account under which services will run
- A local user account for PostgreSQL
- A group account under which services will run

We reviewed the instructions ( here http://docs.chef.io/server/install_server.html#standalone ) for the CentOS 6.

## Usage

### Development:

    $ vagrant up
    $ vagrant provision

Open: https://192.168.0.43/

### Production:

    $ ansible-playbook playbook.yml -i hosts --limit="production"

### Both:

    $ ansible-playbook playbook.yml -i hosts

## Configuration

Use direnv or similar to provide ENV variables with:

    export CHEF_PASSWORD=SOMEPASSWORD
    export CHEF_RPM_PATH="PATH TO LOCAL RPM"
    export CHEF_USER="someuser"
    export CHEF_FIRSTNAME="Name"
    export CHEF_LASTNAME="LastName"
    export CHEF_EMAIL="some@email.com"
    export CHEF_RSA_FILE="rsafilename.pem"
    export CHEF_ORGANIZATION_ID="organization_id"
    export CHEF_ORGANIZATION="Organization Name"
    
    export SERVER_ADMIN="SERVER_ADMIN_USER"

## Configure Chef Server

After all that hacking... surely now it works, right?
