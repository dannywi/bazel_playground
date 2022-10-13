"""
Starlark Playground
"""

def _fibo(n):
    if n < 2:
        #print(n)
        return n
    a = [0, 1]
    for i in range(2, n + 1):
        c = a[i - 2] + a[i - 1]

        #print(a[i - 2] + a[i - 1])
        a = a + [c]
    return a[-1]

def _try_action(ctx):
    pass

def _foo_binary_impl(ctx):
    print("FOO ANALYZING: {}".format(ctx.label))
    print("FOO ATTR: {}".format(ctx.attr))
    print("FOO BIN DIR: {}".format(ctx.bin_dir.path))
    print("FOO BUILD FILE PATH: {}".format(ctx.build_file_path))
    print("FOO HOST PATH SEPARATOR: [{}]".format(ctx.configuration.host_path_separator))
    print("FOO EXECUTABLE: [{}]".format(ctx.executable.to_proto()))
    print("FOO FEATURES: [{}]".format(ctx.features))
    print("FOO FILE: [{}]".format(ctx.file.to_proto()))
    print("FOO FILES: [{}]".format(ctx.files.to_proto()))
    print("FOO GEN FILES DIR: [{}]".format(ctx.genfiles_dir.path))
    print("FOO INFO FILE: [{}]".format(ctx.info_file.path))
    print("FOO LABEL: [{}][{}]".format(ctx.label.name, ctx.label.workspace_name))
    print("FOO WORKSPACE NAME: [{}]".format(ctx.workspace_name))
    print("FOO FIBO: ", _fibo(50))

    _try_action(ctx)

foo_binary = rule(
    implementation = _foo_binary_impl,
)

print("BAZEL FILE EVAL")

# check this: https://github.com/bazelbuild/examples/tree/main/rules/expand_template
