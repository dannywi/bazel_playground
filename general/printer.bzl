"""
Printer
"""

def _impl(ctx):
    print("target {} has {} deps".format(ctx.label, len(ctx.attr.deps)))

    for i, d in enumerate(ctx.attr.deps):
        print(".. {}. label [{}]".format(i, d.label))
        print(".. files = " + str([f.path for f in d.files.to_list()]))

    print("CTX: [{}]".format(dir(ctx)))
    print("ATTR: [{}]".format(dir(ctx.attr)))

printer = rule(
    implementation = _impl,
    attrs = {
        # do not declare "name", it's added automatically
        "number": attr.int(default = 7),
        "deps": attr.label_list(allow_files = True),
    },
)

def _impl_greet(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".txt")
    ctx.actions.write(
        output = out,
        content = "HELLO {}!\n".format(ctx.attr.username),
    )
    return [DefaultInfo(files = depset([out]))]

greet = rule(
    implementation = _impl_greet,
    attrs = {
        "username": attr.string(),
    },
)
