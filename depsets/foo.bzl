FooFiles = provider("our_transitive_sources")

def get_transitive_srcs(srcs, deps):
    return depset(
        srcs,
        transitive = [dep[FooFiles].our_transitive_sources for dep in deps],
    )

def _foo_library_impl(ctx):
    trans_srcs = get_transitive_srcs(ctx.files.srcs, ctx.attr.deps)
    return [
        FooFiles(our_transitive_sources = trans_srcs),
        DefaultInfo(files = trans_srcs),
    ]

foo_library = rule(
    implementation = _foo_library_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "deps": attr.label_list(),
    },
)

def _foo_binary_impl(ctx):
    compiler = ctx.executable.compiler
    out = ctx.outputs.out
    trans_srcs = get_transitive_srcs(ctx.files.srcs, ctx.attr.deps)
    srcs_list = trans_srcs.to_list()
    ctx.actions.run(
        executable = compiler,
        arguments = [out.path] + [src.path for src in srcs_list],
        inputs = srcs_list,
        tools = [compiler],
        outputs = [out],
    )

_foo_binary = rule(
    implementation = _foo_binary_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "deps": attr.label_list(),
        "compiler": attr.label(
            default = ":compiler",
            allow_files = True,
            executable = True,
            cfg = "exec",
        ),
        "out": attr.output(),
    },
)

def foo_binary(**kwargs):
    _foo_binary(out = "{name}.out".format(**kwargs), **kwargs)
