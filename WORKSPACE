workspace(name = "my-test")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_python",
    sha256 = "aa96a691d3a8177f3215b14b0edc9641787abaaa30363a080165d06ab65e1161",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.0.1/rules_python-0.0.1.tar.gz",
)

local_repository(
    name = "lib1",
    path = "transitive_deps/lib1",
)

local_repository(
    name = "lib2",
    path = "transitive_deps/lib2",
)

# calling lib2's register_deps_lib2 works too
load("@lib1//:deps.bzl", "register_deps")
register_deps()