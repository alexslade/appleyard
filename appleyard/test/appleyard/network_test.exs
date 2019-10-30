defmodule Appleyard.NetworkTest do
  use ExUnit.Case, async: true

  test "stats are unavailable when network isn't present" do
    assert {:unavailable} = Appleyard.Network.wifi_stats()
  end
end
