"""
Execute a binary
"""

def _impl(ctx):
    args = [ctx.outputs.out.path] + [f.path for f in ctx.files.chunks]
    print(".. DEBUG: ", args)

    ctx.actions.run(
        inputs = ctx.files.chunks,
        outputs = [ctx.outputs.out],
        arguments = args,
        progress_message = "merging into {}".format(ctx.outputs.out.short_path),
        executable = ctx.executable.merge_tool,
    )

concat = rule(
    implementation = _impl,
    attrs = {
        "chunks": attr.label_list(allow_files = True),
        "out": attr.output(mandatory = True),
        "merge_tool": attr.label(
            executable = True,
            cfg = "exec",
            allow_files = True,
            #default = Label("//actions_run:merge")
        ),
    },
)
