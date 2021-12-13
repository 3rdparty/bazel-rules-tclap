## Bazel build rules for [tclap](https://github.com/mirror/tclap)

Follows a "repos/deps" pattern (in order to help with recursive dependencies). To use:

1. Copy `bazel/repos.bzl` into your repository at `3rdparty/bazel-rules-tclap/repos.bzl` and add an empty `BUILD` (or `BUILD.bazel`) to `3rdparty/bazel-rules-tclap` as well.

2. Copy all of the directories from `3rdparty` that you ***don't*** already have in ***your*** repository's `3rdparty` directory.

3. Add the following to your `WORKSPACE` (or `WORKSPACE.bazel`):

```bazel
load("//3rdparty/bazel-rules-tclap:repos.bzl", tclap_repos="repos")
tclap_repos()

load("@com_github_3rdparty_bazel_rules_tclap//bazel:deps.bzl", tclap_deps="deps")
tclap_deps()
```

Or ... to simplify others depending on ***your*** repository, add the following to your `repos.bzl`:

```bazel
load("//3rdparty/bazel-rules-tclap:repos.bzl", tclap_repos="repos")

def repos():
    tclap_repos()
```

And the following to your `deps.bzl`:

```bazel
load("@com_github_3rdparty_bazel_rules_tclap//bazel:deps.bzl", tclap_deps="deps")

def deps():
    tclap_deps()
```

4. You can then use `@com_github_tclap_tclap//:tclap` in your target's `deps`.

5. Repeat the steps starting at (1) at the desired version of this repository that you want to use:

| tclap | Copy `bazel/repos.bzl` from: |
| :---: | :--------------------------: |
| 1.2.1 | [3ef04ec](https://github.com/3rdparty/bazel-rules-tclap/tree/3ef04ec8f8717706a7e783160eecf924ca038695) |
