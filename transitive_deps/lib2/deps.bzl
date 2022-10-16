load("@lib1//:deps.bzl", "register_deps")

print("...... OUTSIDE L2")

def register_deps_lib2():
    print("...... INSIDE L2")
    register_deps()
