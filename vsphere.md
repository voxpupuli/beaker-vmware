This doc describes beaker's vSphere hypervisor. This is the interaction layer
that beaker will use to get Systems Under Test (SUTs) from any vSphere
infrastructure that you might have.

**Note** that if you're a puppet-internal user, or an external user that is
using the vmpooler hypervisor, please refer to our [vmpooler doc](https://github.com/puppetlabs/beaker-vmpooler). beaker-vmpooler is now completely independent from beaker-vmware.

The harness can use vms and snapshots that live within vSphere as well.
To do this create a `~/.fog` file with your vSphere credentials:

~~~yaml
default:
  vsphere_server: 'vsphere.example.com'
  vsphere_username: 'joe'
  vsphere_password: 'MyP@$$w0rd'
~~~

This file follows the conventions used by Cloud Provisioner and Fog. Note:

- You *may* use Strings or Ruby Symbols (e.g. `:default`) for keys, as both are formally supported by both Fog and Beaker, however for maximum interoprability it is recommended to use Strings.
- Your fog credential file location may be specified in the 'CONFIG' section using the 'dot_fog' setting. It can also be overridden by setting `ENV["FOG_RC"]` on the beaker coordinator.
- Fog supports multiple configuration sections (called "providers") in a single file. Normally you'll just use `default`, but you can also specify other providers. beaker-vmware doesn't select these, but you can specify them by setting `ENV["FOG_CREDENTIAL"]` on the beaker coordinator.

# Hypervisors

There are two possible `hypervisor` hypervisor-types to use for vSphere testing, `vsphere` and `vcloud`.

## `hypervisor: vsphere`
This option locates an existing static VM, optionally reverts it to a pre-existing snapshot, and runs tests on it.

## `hypervisor: vcloud`
This option clones a new VM from a pre-existing template, runs tests on the newly-provisioned clone, then deletes the clone once testing completes.

The `vcloud` option requires a slightly-modified test configuration file, specifying both the target template as well as three additional parameters in the 'CONFIG' section ('datastore', 'datacenter', and 'folder').  Optionally, a resourcepool may be specified via the 'resourcepool' setting in the 'CONFIG' section.  Template can be expressed in the 'HOSTS' section, or you can set the template to be used via the `BEAKER_vcloud_template` environment variable.

#### Example vcloud hosts file
    HOSTS:
      master-vm:
        roles:
          - master
          - agent
          - dashboard
        platform: ubuntu-10.04-amd64
        template: ubuntu-1004-x86_64
        hypervisor: vcloud
      agent-vm:
        roles:
          - agent
        platform: ubuntu-10.04-i386
        template: ubuntu-1004-i386
        hypervisor: vcloud
    CONFIG:
      consoleport: 443
      datacenter: testdc
      datastore: instance0
      resourcepool: Delivery/Quality Assurance/FOSS/Dynamic
      folder: delivery/Quality Assurance/FOSS/Dynamic
