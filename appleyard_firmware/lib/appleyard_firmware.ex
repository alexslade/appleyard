defmodule AppleyardFirmware do
  @moduledoc """
  Documentation for AppleyardFirmware.
  """

  # TODO: I really don't like how Mox is working here. Am I using the library idiomatically? The problem stems from the
  #       need to have a fake Nerves.Network module in development as well.

  @doc """
  Wifi stats

  ## Examples

      iex> NervesMock.NetworkMock |> expect(:scan, &NervesMock.Network.scan/1)
      iex> AppleyardFirmware.wifi_stats
      %{
        level: -56,
        noise: -89,
        snr: 33
      }

  """

  def wifi_stats do
    with networks <- network().scan("wlan0"),
         internet <- Enum.find(networks, &(&1[:ssid] == "The Internet")) do
      extract_stats(internet)
    end
  end

  defp extract_stats(nil), do: :unavailable

  defp extract_stats(internet) do
    %{
      level: internet[:level],
      noise: internet[:noise],
      snr: internet[:snr]
    }
  end

  defp network do
    Application.get_env(:appleyard_firmware, :network_module)
  end
end
