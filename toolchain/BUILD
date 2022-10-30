load(":cc_toolchain_cfg.bzl", "cc_toolchain_cfg")

package(default_visibility = ["//visibility:public"])

cc_toolchain_suite(
    name = "clang_suite",
    toolchains = {
        "k8": ":k8_toolchain",
    },
)

filegroup(name = "empty")

cc_toolchain_cfg(name = "k8_toolchain_cfg")

cc_toolchain(
    name = "k8_toolchain",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
    toolchain_config = "k8_toolchain_cfg",
    toolchain_identifier = "k8-toolchain",
)
