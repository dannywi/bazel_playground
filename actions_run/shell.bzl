"""
Execute Shell Command
"""

def _emit_size_impl(ctx):
    in_files = ctx.files.files
    in_files_path = " ".join([f.path for f in in_files])
    out_file = ctx.actions.declare_file("{}.size".format(ctx.attr.name))

    ctx.actions.run_shell(
        inputs = in_files,
        outputs = [out_file],
        progress_message = "getting size of '{}'".format(in_files_path),
        command = "wc -c %s | awk '{print $1}' > '%s'" % (in_files_path, out_file.path),
    )

    # tell bazel that the files to build for this target includes 'out_file'
    return [DefaultInfo(files = depset([out_file]))]

emit_size = rule(
    implementation = _emit_size_impl,
    attrs = {
        "files": attr.label_list(
            mandatory = True,
            #allow_single_file = True,
            allow_files = True,
            doc = "The file whose size is computed",
        ),
    },
    doc = "given input file, creates output file with extension .size containing the file size in bytes",
)

def _convert_to_uppercase(ctx):
    in_file = ctx.file.in_file
    out_file = ctx.outputs.out_file
    ctx.actions.run_shell(
        outputs = [out_file],
        inputs = [in_file],
        arguments = [in_file.path, out_file.path],
        command = "tr '[:lower:]' '[:upper:]' < \"$1\" > \"$2\"",
    )

convert_to_uppercase = rule(
    implementation = _convert_to_uppercase,
    attrs = {
        "in_file": attr.label(
            mandatory = True,
            allow_single_file = True,
            doc = "The file to transform",
        ),
        "out_file": attr.output(doc = "the generated file"),
    },
    doc = "transforms given file to all caps",
)
