MySettingProvider = provider(fields = ["varStr"])

def _impl(ctx):
    return MySettingProvider(varStr = ctx.build_setting_value)

my_setting = rule(
    implementation = _impl,
    build_setting = config.string(flag = True),
)
