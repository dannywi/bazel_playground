cc_binary(
    name = "hello-inner",
    srcs = glob(["*.cpp"]),
    visibility = ["//visibility:private"],
)

alias(
    name = "hello",
    actual = ":hello-inner",
    visibility = ["//:__subpackages__"],
)
