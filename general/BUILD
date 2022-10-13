load(":foo.bzl", "foo_binary")
load(":printer.bzl", "greet", "printer")
load(":sum.bzl", "sum")

print("BAZEL BUILD FILE")

foo_binary(name = "bon")

foo_binary(name = "ban")

printer(
    name = "target-1",
    deps = [
        "BUILD",
        ":other",
    ],
)

printer(name = "other")

greet(
    name = "greeting",
    username = "Budi",
)

sum(
    name = "n",
    deps = [
        ":n2",
        ":n5",
    ],
)

sum(
    name = "n2",
    number = 2,
)

sum(
    name = "n5",
    number = 5,
)

sum(
    name = "n_II",
    deps_num_optional = [
        ":n2",
        ":n5",
        ":n",
    ],
)
