load(":def.bzl", "hello")

hello(
    name = "hello_john_src",
    configs = {
        "day": "Friday",
        "weather": "Sunny",
    },
    firstname = "John",
)

hello(
    name = "hello_anna_src",
    configs = {
        "day": "Tuesday",
        "weather": "Partly Cloudy",
    },
    firstname = "Anna",
)

cc_binary(
    name = "hello",
    srcs = [":hello_john_src"],
)

cc_binary(
    name = "hello2",
    srcs = [":hello_anna_src"],
)
