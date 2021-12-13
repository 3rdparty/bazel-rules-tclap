"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    maybe(
        http_archive,
        name = "com_github_tclap_tclap",
        url = "https://github.com/mirror/tclap/archive/tclap-1-2-1-release-final.tar.gz",
        sha256 = "f0ede0721dddbb5eba3a47385a6e8681b14f155e1129dd39d1a959411935098f",
        strip_prefix = "tclap-tclap-1-2-1-release-final",
        repo_mapping = repo_mapping,
        build_file = "@com_github_3rdparty_bazel_rules_tclap//:BUILD.bazel",
    )
