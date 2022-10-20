load("@bazel_skylib//lib:collections.bzl", "collections")
load("@bazel_skylib//lib:dicts.bzl", "dicts")
load(":func.bzl", "tmp", "tmp2")

print("======= SKY LIB ========")

print("... COLLECTIONS")

x = [
    3,
    1,
    2,
    3,
    3,
]

print("... orig:", x)

print(
    "... uniq:",
    collections.uniq(x),
)

[print(
    "...",
    fn(0, x),
) for fn in [
    collections.after_each,
    collections.before_each,
]]

print("... DICTS")

k = {
    "a": 3,
    "b": 4,
    "c": 5,
}

l = {
    "d": 33,
    "e": 44,
    "c": 55,
}

print(
    "...",
    dicts.add(k, l),
)

print(
    "...",
    dicts.add(l, k),
)

print(
    "...",
    dicts.omit(dicts.add(k, l), ["c", "d"]),
)

print(
    "...",
    dicts.pick(dicts.add(l, k), ["c", "d"]),
)

print(tmp.a)
tmp.pr("me")
print(tmp2["a"])
tmp2["pr"]()
