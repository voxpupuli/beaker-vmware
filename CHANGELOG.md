# Changelog

## [2.2.0](https://github.com/voxpupuli/beaker-vmware/tree/2.2.0) (2024-05-28)

[Full Changelog](https://github.com/voxpupuli/beaker-vmware/compare/2.1.1...2.2.0)

**Implemented enhancements:**

- beaker: Allow 6.x [\#49](https://github.com/voxpupuli/beaker-vmware/pull/49) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- voxpupuli-rubocop: require 2.7.0 [\#50](https://github.com/voxpupuli/beaker-vmware/pull/50) ([bastelfreak](https://github.com/bastelfreak))

## [2.1.1](https://github.com/voxpupuli/beaker-vmware/tree/2.1.1) (2024-05-02)

[Full Changelog](https://github.com/voxpupuli/beaker-vmware/compare/2.1.0...2.1.1)

**Fixed bugs:**

- fail if datacenter/datastore could not be found [\#46](https://github.com/voxpupuli/beaker-vmware/pull/46) ([bastelfreak](https://github.com/bastelfreak))

## [2.1.0](https://github.com/voxpupuli/beaker-vmware/tree/2.1.0) (2024-04-23)

[Full Changelog](https://github.com/voxpupuli/beaker-vmware/compare/2.0.0...2.1.0)

**Implemented enhancements:**

- Add Ruby 3.3 to CI matrix [\#43](https://github.com/voxpupuli/beaker-vmware/pull/43) ([bastelfreak](https://github.com/bastelfreak))
- Replace dead dependency rbvmomi with rbvmomi2 [\#41](https://github.com/voxpupuli/beaker-vmware/pull/41) ([bastelfreak](https://github.com/bastelfreak))
- Add Ruby 3.2 support [\#33](https://github.com/voxpupuli/beaker-vmware/pull/33) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- rubocop: Use task from voxpupuli-rubocop [\#42](https://github.com/voxpupuli/beaker-vmware/pull/42) ([bastelfreak](https://github.com/bastelfreak))
- rubocop: safe autocorrection [\#38](https://github.com/voxpupuli/beaker-vmware/pull/38) ([bastelfreak](https://github.com/bastelfreak))
- Update voxpupuli-rubocop requirement from ~\> 1.2 to ~\> 2.0 [\#36](https://github.com/voxpupuli/beaker-vmware/pull/36) ([dependabot[bot]](https://github.com/apps/dependabot))
- GCG: Add faraday-retry dep [\#34](https://github.com/voxpupuli/beaker-vmware/pull/34) ([bastelfreak](https://github.com/bastelfreak))
- switch to voxpupuli-rubocop & Build gems with verbosity and strictness [\#32](https://github.com/voxpupuli/beaker-vmware/pull/32) ([bastelfreak](https://github.com/bastelfreak))

## [2.0.0](https://github.com/voxpupuli/beaker-vmware/tree/2.0.0) (2023-03-28)

[Full Changelog](https://github.com/voxpupuli/beaker-vmware/compare/1.0.0...2.0.0)

**Breaking changes:**

- Drop Ruby 2.4/2.5/2.6 support; Add 3.1 [\#25](https://github.com/voxpupuli/beaker-vmware/pull/25) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Implement rubocop [\#26](https://github.com/voxpupuli/beaker-vmware/pull/26) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Update fakefs requirement from ~\> 0.6 to ~\> 2.4 [\#23](https://github.com/voxpupuli/beaker-vmware/pull/23) ([dependabot[bot]](https://github.com/apps/dependabot))
- CI: Apply Vox Pupuli best practices [\#22](https://github.com/voxpupuli/beaker-vmware/pull/22) ([bastelfreak](https://github.com/bastelfreak))
- dependabot: check for github actions and gems [\#20](https://github.com/voxpupuli/beaker-vmware/pull/20) ([bastelfreak](https://github.com/bastelfreak))
- Update rbvmomi requirement from ~\> 1.9 to \>= 1.9, \< 4.0 [\#12](https://github.com/voxpupuli/beaker-vmware/pull/12) ([dependabot[bot]](https://github.com/apps/dependabot))

## [1.0.0](https://github.com/voxpupuli/beaker-vmware/tree/1.0.0) (2021-08-09)

[Full Changelog](https://github.com/voxpupuli/beaker-vmware/compare/0.3.0...1.0.0)

**Merged pull requests:**

- Add GitHub actions, Update README.md after migration [\#10](https://github.com/voxpupuli/beaker-vmware/pull/10) ([bastelfreak](https://github.com/bastelfreak))
- \(BKR-1509\) Hypervisor usage instructions for Beaker 4.0 [\#9](https://github.com/voxpupuli/beaker-vmware/pull/9) ([Dakta](https://github.com/Dakta))

## [0.3.0](https://github.com/voxpupuli/beaker-vmware/tree/0.3.0) (2018-07-16)

[Full Changelog](https://github.com/voxpupuli/beaker-vmware/compare/0.2.0...0.3.0)

**Merged pull requests:**

- \(MAINT\) Pin fakefs for old Ruby [\#7](https://github.com/voxpupuli/beaker-vmware/pull/7) ([Dakta](https://github.com/Dakta))
- \(BKR-1485\) Update documentation [\#6](https://github.com/voxpupuli/beaker-vmware/pull/6) ([Dakta](https://github.com/Dakta))
- \(BKR-1481\) Rewrite beaker-vmware to use shared .fog parsing [\#5](https://github.com/voxpupuli/beaker-vmware/pull/5) ([Dakta](https://github.com/Dakta))

## [0.2.0](https://github.com/voxpupuli/beaker-vmware/tree/0.2.0) (2017-07-19)

[Full Changelog](https://github.com/voxpupuli/beaker-vmware/compare/0.1.0...0.2.0)

**Merged pull requests:**

- \(BKR-1162\) Add vsphere hypervisor support [\#4](https://github.com/voxpupuli/beaker-vmware/pull/4) ([rishijavia](https://github.com/rishijavia))

## [0.1.0](https://github.com/voxpupuli/beaker-vmware/tree/0.1.0) (2017-07-18)

[Full Changelog](https://github.com/voxpupuli/beaker-vmware/compare/7ddc6f7aa8480bfef0e7d5271c71acf89fce0149...0.1.0)

**Merged pull requests:**

- \(MAINT\) Add simplecov [\#3](https://github.com/voxpupuli/beaker-vmware/pull/3) ([rishijavia](https://github.com/rishijavia))
- \(MAINT\) Add version constant [\#2](https://github.com/voxpupuli/beaker-vmware/pull/2) ([rishijavia](https://github.com/rishijavia))
- \(MAINT\) Update acceptance test instructions [\#1](https://github.com/voxpupuli/beaker-vmware/pull/1) ([rishijavia](https://github.com/rishijavia))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
