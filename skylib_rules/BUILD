load(":settings.bzl", "my_setting")

my_setting(
    name = "file_picker",
    build_setting_default = "MY_DEFAULT",
)

config_setting(
    name = "use_john",
    flag_values = {
        ":file_picker": "JOHN",
    },
)

cc_binary(
    name = "runner",
    srcs = ["hello.cc"] + select({
        ":use_john": ["name1.cc"],
        "//conditions:default": ["name2.cc"],
    }),
)
