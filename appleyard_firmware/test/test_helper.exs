ExUnit.start()

# TODO: I don't like this naming convention, make it better
Mox.defmock(NervesMock.NetworkMock, for: NervesMock.Network)
Application.put_env(:appleyard_firmware, :network_module, NervesMock.NetworkMock)
