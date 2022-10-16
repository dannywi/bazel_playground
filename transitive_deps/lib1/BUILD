cc_library(
    name = "lib",
    srcs = [
        "looper.hpp",
    ],
    visibility = ["//visibility:public"],
)

cc_test(
    name = "test_looper",
    srcs = glob(["test*.cpp"]),
    deps = [
        ":lib",
        "@googletest//:gtest_main",
    ],
)
