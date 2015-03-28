## Chef server Deployment tools

Manifests / modules to help the deploy of Chef server 12 on CentOS 6 with either Ansible

## Background

The Chef server 12 has the following prerequisites:

- An x86_64 compatible system architecture; Red Hat Enterprise Linux and CentOS may require updates prior to installation
- A resolvable hostname that is specified using a FQDN or an IP address
- A connection to NTP to prevent clock drift
- A local mail transfer agent that allows the Chef server to send email notifications
- Using cron and the /etc/cron.d directory for periodic maintenance tasks
- Disabling the Apache Qpid daemon on CentOS and Red Hat systems
- A local user account under which services will run
- A local user account for PostgreSQL
- A group account under which services will run

I reviewed the instructions ( here http://docs.chef.io/server/install_server.html#standalone ) for the CentOS 6.

## Usage

### Development:

    $ vagrant up
    $ vagrant provision # For updates

Open: https://192.168.0.43/

SSH: `$ vagrant ssh`

### Production:

For the first time we will login with `root`:

    $ ansible-playbook playbook.yml -i hosts --limit="production" --extra-args="init=y"

Next time, when root access will be restricted, use environment variable for `SERVER_ADMIN_USER`:

    $ ansible-playbook playbook.yml -i hosts --limit="production"

For only Chef server 12 updates, with cleanup & modules update:

    $ ansible-playbook playbook.yml -i hosts --extra-args="update=y"

For update Chef server 12 & CentOS 6 components via `yum`:

    $ ansible-playbook playbook.yml -i hosts --extra-args="server_update=y"

Open: https://chef.cnsa.ru/

SSH: `$ SERVER_ADMIN_USER@chef.cnsa.ru`

### Both:

    $ ansible-playbook playbook.yml -i hosts  

## Configuration

Use `direnv` or similar to provide ENV variables with:

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

## Configure Chef server 12

After all that hacking... surely now it works, right?
