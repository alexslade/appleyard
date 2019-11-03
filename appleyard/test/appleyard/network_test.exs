defmodule Appleyard.NetworkTest do
  use ExUnit.Case, async: true
  import Mox

  setup do
    Mox.defmock(NetworkMock, for: Services.Network.Behavior)
    Application.put_env(:appleyard, :network_service, NetworkMock)
  end

  test "stats are unavailable when no network is present" do
    NetworkMock
    |> expect(:scan, fn _ -> [] end)

    assert {:error, :unavailable} = Appleyard.Network.signal_strength()
  end

  test "stats are unavailable when network called 'The Internet' is missing" do
    networks = [%{ssid: "Karens unsecured home router", level: -20, noise: -15, snr: 5}]

    NetworkMock
    |> expect(:scan, fn _ -> networks end)

    assert {:error, :unavailable} = Appleyard.Network.signal_strength()
  end

  test "stats are extracted from the network scan results" do
    networks = [
      %{ssid: "Karens unsecured home router", level: -50, noise: -45, snr: 5},
      %{ssid: "The Internet", level: -30, noise: -21, snr: 9}
    ]

    NetworkMock
    |> expect(:scan, fn _ -> networks end)

    assert {:ok, %{level: -30, noise: -21, snr: 9}} = Appleyard.Network.signal_strength()
  end
end
