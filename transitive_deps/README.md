# Transitive Dependencies
Experiments on how to get all the dependencies or a dependency
* `lib1` has a function `register_deps` to call all its depedencies
* `lib2` uses dep(s) from `lib1`, so it calls that `register_deps`, instead of repeating the actual dependency

This now all work
```bash
# at transitive_deps/lib1
bazel test -test_output=all //:all

# at transitive_deps/lib2
bazel test -test_output=all //:all

# at project root
# somehow 'bazel test @lib1//:all' fails, but the below works
bazel build @lib1//:all
./bazel-bin/external/lib1/test_looper

bazel build @lib2//:all
./bazel-bin/external/lib2/test_adder
```