defmodule AppleyardFirmwareTest do
  use ExUnit.Case
  import Mox
  doctest AppleyardFirmware

  # test "greets the world" do
  #   assert AppleyardFirmware.hello() == :world
  # end

  test "returns unavailable if no network is found" do
    NervesMock.NetworkMock
    |> expect(:scan, fn _interface -> [] end)

    assert AppleyardFirmware.wifi_stats() == :unavailable
  end
end
