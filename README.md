## Chef server 12 Deployment tools

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

## Configuration

1. Copy `hosts.sample` file into `hosts`.
2. Edit domain/credentials settings in `hosts`.
3. Copy `settings.yml.sample` file into `settings.yml`.
4. Edit primary settings in `settings.yml`.

## Usage

### Development:

    $ vagrant up
    $ vagrant provision # For updates

Open: https://192.168.0.43/

SSH: `$ vagrant ssh`

### Azure:

    $ ansible-playbook azure.yml"

**Example vars**:
You can support it with [Direnv](https://github.com/zimbatm/direnv) or similar tool.

    AZURE_CERT_PATH="/path/to/azure.pem"
    AZURE_SUBSCRIPTION_ID="SOMELONGID"
    AZURE_SSH_PEM="/path/to/ssh.pem"
    AZURE_VM_NAME="VMNAME"
    AZURE_VM_USER="VMUSER"

    export AZURE_CERT_PATH AZURE_SUBSCRIPTION_ID AZURE_SSH_PEM AZURE_VM_NAME AZURE_VM_USER

### Production:

For the first time if we need login as `root`:

    $ ansible-playbook playbook.yml -i hosts --limit="production" --extra-vars="init=y"

Next time, when root access will be restricted:

    $ ansible-playbook playbook.yml -i hosts --limit="production"

For only Chef server 12 updates, with cleanup & modules update:

    $ ansible-playbook playbook.yml -i hosts --extra-vars="update=y"

For update Chef server 12 & CentOS 6 components via `yum`:

    $ ansible-playbook playbook.yml -i hosts --extra-vars="server_update=y"

Open: https://YOUR_PRODUCTION_SERVER/

SSH: `$ ssh SERVER_ADMIN_USER@chef.cnsa.ru -i PATH_TO_YOUR_KEY_OR_ADD_DOMAIN_TO_CONFIG`

### Both:

    $ ansible-playbook playbook.yml -i hosts  

## Configure Chef server 12

After all that hacking... surely now it works, right?
