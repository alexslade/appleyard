defmodule AppleyardFirmware do
  @moduledoc """
  Documentation for AppleyardFirmware.
  """

  # TODO: I don't like this setup for the doctests, it seems kinda useless to have this setup here - move to a test?

  @doc """
  Wifi stats

  ## Examples

      iex> :rand.seed(:exsplus, {1,2,3})
      iex> NervesMock.NetworkMock |> expect(:scan, &NervesMock.Network.scan/1)
      iex> AppleyardFirmware.wifi_stats
      %{
        level: -87,
        noise: -48,
        snr: 20
      }

  """

  def wifi_stats do
    # with networks <- network().scan("wlan0"),
    #      internet <- Enum.find(networks, &(&1[:ssid] == "The Internet")) do
    #   extract_stats(internet)
    # end
    Enum.random(0..100)
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
