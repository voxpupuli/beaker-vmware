# beaker-vmware

Beaker library to use vmware fusion hypervisor

# How to use this wizardry

This gem allows you to use hosts with [vmware_fusion](vmware_fusion.md) and [vsphere](vsphere.md) hypervisor with [beaker](https://github.com/puppetlabs/beaker).

### Right Now? (beaker 3.x)

This gem is already included as [beaker dependency](https://github.com/puppetlabs/beaker/blob/master/beaker.gemspec) for you, so you don't need to do anything special to use this gem's functionality with beaker.

### In beaker's Next Major Version? (beaker 4.x)

In beaker's next major version, the requirement for beaker-vmware will be pulled
from that repo. When that happens, then the usage pattern will change. In order
to use this then, you'll need to include beaker-vmware as a dependency right
next to beaker itself.

# Spec tests

Spec test live under the `spec` folder. There are the default rake task and therefore can run with a simple command:

```console
$ bundle exec rake test:spec
```

# Acceptance tests

We run beaker's base acceptance tests with this library to see if the hypervisor is working with beaker. You can run the acceptance tests locally; see [Acceptance Setup](acceptance_setup.md). Once that's setup, there is a simple rake task to invoke acceptance test for the library:

```console
$ bundle exec rake test:acceptance
```

# Contributing

Please refer to puppetlabs/beaker's [contributing](https://github.com/puppetlabs/beaker/blob/master/CONTRIBUTING.md) guide.
