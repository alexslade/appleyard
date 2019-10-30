defmodule Appleyard.Network do
  def signal_strength do
    network_service().scan("wlan0")
    |> Enum.find(&(&1[:ssid] == "The Internet"))
    |> extract_strength
  end

  defp extract_strength(nil), do: {:error, :unavailable}
  defp extract_strength(network), do: {:ok, Map.take(network, [:level, :noise, :snr])}

  defp network_service do
    Application.get_env(:appleyard, :network_service)
  end
end
