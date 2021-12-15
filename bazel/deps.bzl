"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    maybe(
        http_archive,
        name = "com_github_tclap_tclap",
        url = "https://sourceforge.net/projects/tclap/files/tclap-1.4.0-rc1.tar.bz2",
        sha256 = "33e18c7828f76a9e5f2a00afe575156520e383693059ca9bc34ff562927e20c6",
        strip_prefix = "tclap-1.4.0-rc1",
        repo_mapping = repo_mapping,
        build_file = "@com_github_3rdparty_bazel_rules_tclap//:BUILD.bazel",
    )
