# Versioning and Release

This document details the versioning and release plan.

Stability is a top goal for this project, and we hope that this document and the processes
it entails will help to achieve that. It covers the release process, versioning
numbering, backporting, API stability and support horizons.

If you rely on containerd, it would be good to spend time understanding the
areas of the API that are and are not supported and how they impact your
project in the future.

This document will be considered a living document. Supported timelines,
backport targets and API stability guarantees will be updated here as they
change.

If there is something that you require or this document leaves out, please
reach out by [filing an issue](https://github.com/containerd/containerd/issues).

## Releases

Releases of containerd will be versioned using dotted triples, similar to
[Semantic Version](http://semver.org/). For the purposes of this document, we
will refer to the respective components of this triple as
`<major>.<minor>.<patch>`. The version number may have additional information,
such as alpha, beta and release candidate qualifications. Such releases will be
considered "pre-releases".

### Major and Minor Releases

Major and minor releases of containerd will be made from main. Releases of
containerd will be marked with GPG signed tags and announced at
https://github.com/containerd/containerd/releases. The tag will be of the
format `v<major>.<minor>.<patch>` and should be made with the command `git tag
-s v<major>.<minor>.<patch>`.

After a minor release, a branch will be created, with the format
`release/<major>.<minor>` from the minor tag. All further patch releases will
be done from that branch. For example, once we release `v1.0.0`, a branch
`release/1.0` will be created from that tag. All future patch releases will be
done against that branch.

### Pre-releases

Pre-releases, such as alphas, betas and release candidates will be conducted
from their source branch. For major and minor releases, these releases will be
done from main. For patch releases, these pre-releases should be done within
the corresponding release branch.

While pre-releases are done to assist in the stabilization process, no
guarantees are provided.

### Upgrade Path

The upgrade path for containerd is such that the 0.0.x patch releases are
always backward compatible with its major and minor version. Minor (0.x.0)
version will always be compatible with the previous minor release. i.e. 1.2.0
is backwards compatible with 1.1.0 and 1.1.0 is compatible with 1.0.0. There is
no compatibility guarantees for upgrades that span multiple, _minor_ releases.
For example, 1.0.0 to 1.2.0 is not supported. One should first upgrade to 1.1,
then 1.2.

There are no compatibility guarantees with upgrades to _major_ versions. For
example, upgrading from 1.0.0 to 2.0.0 may require resources to migrated or
integrations to change. Each major version will be supported for at least 1
year with bug fixes and security patches.

### Next Release

The activity for the next release will be tracked in the
[milestones](https://github.com/containerd/containerd/milestones). If your
issue or PR is not present in a milestone, please reach out to the maintainers
to create the milestone or add an issue or PR to an existing milestone.

### Support Horizon

Support horizons will be defined corresponding to a release branch, identified
by `<major>.<minor>`. Release branches will be in one of several states:

- __*Next*__: The next planned release branch.
- __*Active*__: The release is a stable branch which is currently supported and accepting patches.
- __*Extended*__: The release branch is only accepting security patches.
- __*LTS*__: The release is a long term stable branch which is currently supported and accepting patches.
- __*End of Life*__: The release branch is no longer supported and no new patches will be accepted.

Releases will be supported at least one year after a _minor_ release. This means that
we will accept bug reports and backports to release branches until the end of
life date. If no new _minor_ release has been made, that release will be
considered supported until 6 months after the next _minor_ is released or one year,
whichever is longer. Additionally, releases may have an extended security support
period after the end of the active period to accept security backports. This
timeframe will be decided by maintainers before the end of the active status.

Long term stable (_LTS_) releases will be supported for at least three years after
their initial _minor_ release. These branches will accept bug reports and
backports until the end of life date. They may also accept a wider range of
patches than non-_LTS_ releases to support the longer term maintainability of the
branch, including library dependency, toolchain (including Go) and other version updates
which are needed to ensure each release is built with fully supported dependencies and
remains usable by containerd clients. _LTS_ releases can also accept feature backports
to support new Kubernetes releases. The default action has to be reject it though,
for long-term stability. This is still negotiable when the feature is a hard dependency
for a new release of Kubernetes. There should be at least a 6-month overlap between
the end of life of an _LTS_ release and the initial release of a new _LTS_ release.
Up to 6 months before the announced end of life of an _LTS_ branch, the branch may
convert to a regular _Active_ release with stricter backport criteria.

The current state is available in the following tables:

| Release                                                              | Status        | Start              | End of Life                                             |
| ---------                                                            | ------------- | ------------------ | -------------------                                     |
| [0.0](https://github.com/containerd/containerd/releases/tag/0.0.5)   | End of Life   | Dec 4, 2015        | -                                                       |
| [0.1](https://github.com/containerd/containerd/releases/tag/v0.1.0)  | End of Life   | Mar 21, 2016       | -                                                       |
| [0.2](https://github.com/containerd/containerd/releases/tag/v1.5.18) | End of Life   | May 3, 2021        | February 28, 2023                                       |
| [1.0](https://github.com/containerd/containerd/releases/tag/v1.6.23) | LTS           | February 15, 2022  | max(February 15, 2025 or next LTS + 6 months)           |
| [1.1](https://github.com/containerd/containerd/releases/tag/v1.7.3)  | Active        | March 10, 2023     | active(release of 2.0 + 6 months), extended(EOL of 1.6) |
| [2.0](https://github.com/containerd/containerd/milestone/35)         | Next          | TBD                | TBD                                                     |


### Backporting

Backports in containerd are community driven. As maintainers, we'll try to
ensure that sensible bugfixes make it into _active_ release, but our main focus
will be features for the next _minor_ or _major_ release. For the most part,
this process is straightforward, and we are here to help make it as smooth as
possible.

If there are important fixes that need to be backported, please let us know in
one of three ways:

1. Open an issue.
2. Open a PR with cherry-picked change from main.
3. Open a PR with a ported fix.

__If you are reporting a security issue:__

Please follow the instructions at [example/project](https://github.com/example/project/blob/main/SECURITY.md#reporting-a-vulnerability)

Remember that backported PRs must follow the versioning guidelines from this document.

Any release that is "active" can accept backports. Opening a backport PR is
fairly straightforward. The steps differ depending on whether you are pulling
a fix from main or need to draft a new commit specific to a particular
branch.

To cherry-pick a straightforward commit from main, simply use the cherry-pick
process:

1. Pick the branch to which you want backported, usually in the format
   `release/<major>.<minor>`. The following will create a branch you can
   use to open a PR:

	```console
	$ git checkout -b my-backport-branch release/<major>.<minor>.
	```

2. Find the commit you want backported.
3. Apply it to the release branch:

	```console
	$ git cherry-pick -xsS <commit>
	```

   If all of the work from a particular PR/set of PRs is wanted,
   cherry-pick the individual commits instead of the merge commit.
   Take #8624 for example, 82ec62b is favored over 9e834e7.

   (Optional) If other commits exist in the main branch which are related
   to the cherry-picked commit; eg: fixes to the main PR. It is recommended
   to cherry-pick those commits also into this same `my-backport-branch`.
4. Push the branch and open up a PR against the _release branch_:

	```
	$ git push -u stevvooe my-backport-branch
	```

   Make sure to replace `stevvooe` with whatever fork you are using to open
   the PR. When you open the PR, make sure to switch `main` with whatever
   release branch you are targeting with the fix. Make sure the PR title has
   `[<release branch>]` prefixed. e.g.:

   ```
   [release/1.4] Fix foo in bar
   ```

If there is no existing fix in main, you should first fix the bug in main,
or ask us a maintainer or contributor to do it via an issue. Once that PR is
completed, open a PR using the process above.

Only when the bug is not seen in main and must be made for the specific
release branch should you open a PR with new code.

## Public API Stability

The following table provides an overview of the components covered by
containerd versions:


| Component        | Status   | Stabilized Version | Links         |
|------------------|----------|--------------------|---------------|
| Generic API      | Stable   | 1.0                | [Generic API](#generic-api) |
| Metrics API      | Stable   | 1.0                | - |
| Plugins API      | Stable   | 1.0                | - |


### Generic API

...


### Metrics API

The metrics API that outputs prometheus style metrics will be versioned independently,
prefixed with the API version. i.e. `/v1/metrics`, `/v2/metrics`.

The metrics API version will be incremented when breaking changes are made to the prometheus
output. New metrics can be added to the output in a backwards compatible manner without
bumping the API version.

### Plugins API

Based on a modular design where plugins are implemented to provide the core functionality.
Plugins implemented in tree are supported by the containerd community unless explicitly specified as non-stable.
Out of tree plugins are not supported by the containerd maintainers.

#### Error Codes

Error codes will not change in a patch release, unless a missing error code
causes a blocking bug. Error codes of type "unknown" may change to more
specific types in the future. Any error code that is not "unknown" that is
currently returned by a service will not change without a _major_ release or a
new version of the service.

If you find that an error code that is required by your application is not
well-documented in the protobuf service description or tested explicitly,
please file an issue and we will clarify.

### Not Covered

As a general rule, anything not mentioned in this document is not covered by
the stability guidelines and may change in any release. Explicitly, this
pertains to this non-exhaustive list of components:

- File System layout
- Storage formats
- Snapshot formats

Between upgrades of subsequent, _minor_ versions, we may migrate these formats.
Any outside processes relying on details of these file system layouts may break
in that process. Container root file systems will be maintained on upgrade.

### Exceptions

We may make exceptions in the interest of __security patches__. If a break is
required, it will be communicated clearly and the solution will be considered
against total impact.

## Deprecated features

The deprecated features are shown in the following table:

| Component                                                                        | Deprecation release | Target release for removal            | Recommendation                           |
|----------------------------------------------------------------------------------|---------------------|---------------------------------------|------------------------------------------|
| Runtime V1 API and implementation (`io.containerd.runtime.v1.linux`)             | containerd v1.4     | containerd v2.0 ✅                    | Use `io.containerd.runc.v2`              |
| Runc V1 implementation of Runtime V2 (`io.containerd.runc.v1`)                   | containerd v1.4     | containerd v2.0 ✅                    | Use `io.containerd.runc.v2`              |


### Deprecated config properties
The deprecated properties in [`config.toml`](./docs/cri/config.md) are shown in the following table:

| Property Group                                                       | Property                     | Deprecation release | Target release for removal | Recommendation                                  |
|----------------------------------------------------------------------|------------------------------|---------------------|----------------------------|-------------------------------------------------|
|`[plugins."io.containerd.grpc.v1.cri"]`                               | `systemd_cgroup`             | containerd v1.3     | containerd v2.0 ✅         | Use `SystemdCgroup` in runc options (see below) |
|`[plugins."io.containerd.grpc.v1.cri".containerd]`                    | `untrusted_workload_runtime` | containerd v1.2     | containerd v2.0 ✅         | Create `untrusted` runtime in `runtimes`        |


<details><summary>Example: runc option <code>SystemdCgroup</code></summary><p>

```toml
version = 2

# OLD
# [plugins."io.containerd.grpc.v1.cri"]
#   systemd_cgroup = true

# NEW
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
  SystemdCgroup = true
```

</p></details>

## Experimental features

Experimental features are new features added to containerd which do not have the
same stability guarantees as the rest of containerd. An effort is made to avoid
breaking interfaces between versions, but changes to experimental features before
being fully supported is possible. Users can still expect experimental features
to be high quality and are encouraged to use new features to help them stabilize
more quickly.

| Component                                                                              | Initial Release | Target Supported Release |
|----------------------------------------------------------------------------------------|-----------------|--------------------------|
| [Sandbox Service](https://github.com/containerd/containerd/pull/6703)                  | containerd v1.7 | containerd v2.0          |
| [Sandbox CRI Server](https://github.com/containerd/containerd/pull/7228)               | containerd v1.7 | containerd v2.0          |
