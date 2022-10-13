load("@rules_python//python:defs.bzl", "py_binary")
load(":foo.bzl", "foo_binary", "foo_library")

# our compiler
py_binary(
    name = "our_compiler",
    srcs = ["our_compiler.py"],
)

foo_library(
    name = "our_lib_a",
    srcs = [
        "a.c",
        "a.h",
    ],
)

foo_library(
    name = "our_lib_b",
    srcs = [
        "b.c",
        "b.h",
    ],
    deps = [":our_lib_a"],
)

foo_library(
    name = "our_lib_c",
    srcs = [
        "c.c",
        "c.h",
    ],
    deps = [":our_lib_a"],
)

foo_binary(
    name = "our_bin",
    srcs = ["d.c"],
    compiler = ":our_compiler",
    deps = [
        ":our_lib_b",
        ":our_lib_c",
    ],
)
