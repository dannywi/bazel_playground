load(":execute.bzl", "concat")

_merge_tool = select({
    #"//conditions:default": "merge_on_linux",
    "on_linux": "merge_on_linux",
    "on_mac": "merge_on_linux",
    "on_windows": "merge_on_windows",
})

concat(
    name = "sh",
    out = "result.txt",
    chunks = glob(["*.txt"]),
    merge_tool = _merge_tool,
)

sh_binary(
    name = "merge_on_linux",
    srcs = ["merge.sh"],
)

sh_binary(
    name = "merge_on_windows",
    srcs = ["merge.bat"],
    target_compatible_with = [
        "@platforms//os:windows",
    ],
)

config_setting(
    name = "on_linux",
    constraint_values = [
        "@platforms//os:linux",
    ],
)

config_setting(
    name = "on_mac",
    constraint_values = [
        "@platforms//os:macos",
    ],
)

config_setting(
    name = "on_windows",
    constraint_values = [
        "@platforms//os:windows",
    ],
)

####################
load(":file.bzl", "my_file_write")

my_file_write(
    name = "hellosan",
    content = "HELLO BAZEL!\n",
)

####################
load(":shell.bzl", "convert_to_uppercase", "emit_size")

emit_size(
    name = "sizes",
    files = [
        "a.txt",
        "c.txt",
    ],
)

convert_to_uppercase(
    name = "make_upper",
    in_file = "a.txt",
    out_file = "a_upper.txt",
)

concat(
    name = "concat_upper",
    out = "result2.txt",
    chunks = glob(["*.txt"]) + [
        ":sizes",
        ":make_upper",
    ],
    merge_tool = _merge_tool,
)
