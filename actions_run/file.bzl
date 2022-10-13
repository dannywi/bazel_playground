"""
WRITE TRIAL
"""

def my_file_write(**kwargs):
    _file_write(my_out = "{name}.txt".format(**kwargs), **kwargs)

def _impl(ctx):
    output = ctx.outputs.my_out
    ctx.actions.write(output = output, content = ctx.attr.content)

_file_write = rule(
    implementation = _impl,
    attrs = {
        "content": attr.string(),
        "my_out": attr.output(),
    },
)
