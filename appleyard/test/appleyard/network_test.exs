defmodule Appleyard.NetworkTest do
  use ExUnit.Case, async: true

  test "stats are unavailable when network isn't present" do
    assert {:error, :unavailable} = Appleyard.Network.signal_strength()
  end
end
