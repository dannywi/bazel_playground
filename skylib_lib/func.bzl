
def _pr(arg):
  print("HELLO", arg)

tmp = struct(
  a = 3,
  b = 4,
  pr = _pr
)

tmp2 = {
  "a": 33,
  "b": 44,
  "pr": lambda: _pr("you")
}
