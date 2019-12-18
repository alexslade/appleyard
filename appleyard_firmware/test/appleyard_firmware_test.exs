defmodule AppleyardFirmwareTest do
  use ExUnit.Case
  import Mox
  doctest AppleyardFirmware

  # test "greets the world" do
  #   assert AppleyardFirmware.hello() == :world
  # end

  # test "returns unavailable if no network is found" do
  #   NervesMock.Network
  #   |> expect(:scan, fn _interface -> [] end)

  #   assert NervesMock.Network.scan() == []
  # end
end
