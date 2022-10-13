"""
Generate file using template
"""

def hello(**kwargs):
    _hello(
        source_file = "{name}.cc".format(**kwargs),
        **kwargs
    )

def _hello_impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file._template,
        output = ctx.outputs.source_file,
        substitutions = {
            "{FIRSTNAME}": ctx.attr.firstname,
            "{DAY}": ctx.attr.configs["day"],
            "{WEATHER}": ctx.attr.configs["weather"],
        },
    )

_hello = rule(
    implementation = _hello_impl,
    attrs = {
        "firstname": attr.string(mandatory = True),
        "configs": attr.string_dict(mandatory = True),
        "_template": attr.label(
            default = "hello.cc",
            allow_single_file = True,
        ),
        "source_file": attr.output(mandatory = True),
    },
)
