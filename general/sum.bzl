"""
rule with mandatory provider
"""

NumberInfo = provider("number")

def _impl(ctx):
    result = ctx.attr.number
    for dep in ctx.attr.deps:
        result += dep[NumberInfo].number
    print(str(result))
    ctx.actions.write(output = ctx.outputs.out, content = str(result) + "\n")

    return [NumberInfo(number = result)]

_sum = rule(
    implementation = _impl,
    attrs = {
        "number": attr.int(default = 44),
        # all deps must provide all listed providers
        "deps": attr.label_list(providers = [NumberInfo]),
        "deps_num_optional": attr.label_list(),
        "out": attr.output(),
    },
)

def sum(**kwargs):
    _sum(out = "{name}.sum".format(**kwargs), **kwargs)
