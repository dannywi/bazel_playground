cc_library(
    name = "lib",
    srcs = [
        "adder.hpp",
    ],
    visibility = ["//visibility:public"],
)

cc_test(
    name = "test_adder",
    srcs = glob(["test*.cpp"]),
    deps = [
        ":lib",
        "@googletest//:gtest_main",
    ],
)
