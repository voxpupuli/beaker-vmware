Setting up a local environment for running beaker-vmware's acceptance tests is as follows. This is just Beaker's core acceptance tests run against local VMWare Fusion VMs.

# Configure Acceptance Testing VMs

First, provision a base VM to clone for testing. Currently, tests are confirmed to pass on a vanilla Ubuntu 16.04 installation. However, any host supported by Beaker should be suitable. There are no prerequisite libraries and the only special configuration is to enable passwordless SSH access for root.

## Provision a Base VM

These instructions cover provisioning a Ubuntu 16.04 VM:

1. Download [a Ubuntu 16.04 64-bit ISO](http://releases.ubuntu.com/16.04/).
2. Create a new VMWare Virtual Machine for it, named `beaker-ubuntu-1604-64`.
3. Run the OS installation. Default settings should be adequate. Name the main user whatever you want; testing relies on passwordless root login so this is unimportant.
4. Install and configure OpenSSH on the VM:
    ~~~console
    $ sudo su -
    root@host $ apt-get install openssh-server
    root@host $ nano /etc/ssh/sshd_config
    # Add/uncomment/modify the following lines:
    PasswordAuthentication yes
    PermitRootLogin without-password
    RSAAuthentication yes
    PubkeyAuthentication yes
    root@host $ service ssh restart
    ~~~
5. Disable automatic package updates so they don't block test running. This can be accomplished easily from the UI: System Settings > Software & Updates > Updates > Automatically check for updates: "Never".

## Configure Testing VMs

These instructions cover provisioning the two testing VMs with a new public key for SSH access. We need two instances of the base VM, `beaker-ubuntu-1604-64` and `beaker-ubuntu-1604-64-2`:

1. You can use the base VM configuration as the first SUT to save space.
2. Configure a static IP for the VM. See [fusion_static_ip.md](fusion_static_ip.md).
3. Add an entry in /etc/hosts: `<static ip> beaker-ubuntu.local`.
4. Set Up password-less SSH access:
    - Generate a new SSH key *without a passphrase*:
        ~~~console
        $ ssh-keygen -t rsa -b 4096 -C "you@example.com"
        # Give this a descriptive name, e.g. "id_rsa-beaker-ubuntu"
        # Make sure to leave passphrase blank (just hit return at prompt)
        ~~~
    - Add it to your local keychain:
        ~~~console
        $ ssh-add -i ~/.ssh/id_rsa-beaker-ubuntu
        ~~~
    - Add your SSH key to the VM's authorized keys:
        ~~~console
        $ ssh-copy-id puppetlabs@beaker-ubuntu.local
        $ ssh puppetlabs@beaker-ubuntu.local
        ~~~
    - And then copy to root's `authorized_keys`:
        ~~~console
        $ ssh puppetlabs@beaker-ubuntu.local
        puppetlabs@beaker-ubuntu.local $ sudo cp ~/.ssh/authorized_keys /root/.ssh/authorized_keys
        ~~~
    - Ensure that you can SSH in without password, e.g.:
        ~~~console
        $ ssh root@beaker-ubuntu.local
        ~~~
5. Create a new snapshot (of the running VM) in VMWare Fusion: with the VM selected, Virtual Machine > Snapshots... > Take Snapshot (Cmd-Shift-S). Name this new snapshot `clear-keys`. This snapshot name is used in [acceptance/config/nodes/test-nodes.yml](/acceptance/config/nodes/test-nodes.yml); when beaker provisions a VMWare host it restores it to a specified snapshot.
6. Clone the second testing VM from this snapshot.
    1. Right Click > "Create Full Clone" named `beaker-ubuntu-1604-64-2`.
    2. Resume the clone and note the MAC address: VM > Settings > Network > Advanced. Make sure it's different from the original.
    3. Configure a new static IP for this VM. See [fusion_static_ip.md](fusion_static_ip.md) again.
    4. Add another entry in `/etc/hosts`: `<static ip> beaker-ubuntu2.local`.
    5. Create a new snapshot named `clear-keys`.

# Configure Fission

Although originally written for VMWare Fusion 3.x, the Ruby Gem Fission which we use to configure VMWare Fusion VMs appears to work just fine with 10.x. All that is required is changing the local configuration to point to the CLI tools and VM datastore. Create `~/.fissionrc`:

~~~yaml
vm_dir: "/Users/<your user name>/Documents/Virtual Machines.localized/" # or whereved you've decided to store your `.vmwarevm` files
vmrun_bin: "/Applications/VMware Fusion.app/Contents/Library/vmrun"
~~~

# DHCP/VMnet Issues

If you have problems with DHCP leases not being issued automatically when a VM is booted or resumed, and manually restarting vmnet makes it work, follow debugging directions in [Debugging](fusion_static_ip.md#debugging).

# Test Failures

If you get test failures related to package installation, e.g.:

~~~
E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable)
E: Unable to lock the administration directory (/var/lib/dpkg/), is another process using it?>
~~~

It's probably the VM's automatic upgrades running. Log in and check:

~~~console
$ sudo lsof /var/lib/dpkg/lock
COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF   NODE NAME
unattende 2441 root    4uW  REG    8,1        0 671664 /var/lib/dpkg/lock
$ ps -p 2441 -o command=
/usr/bin/python3 /usr/bin/unattended-upgrade # yep, autoupdate
~~~

Turn those off if you haven't already; they'll get run on the first resume during every update period (default: daily) and cause your tests to fail. Don't forget to update the `clear-keys` snapshot after you make configuration changes in the testing VMs.

# Helpful References

- Passwordless root ssh on Ubuntu: https://askubuntu.com/a/115323
