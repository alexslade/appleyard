defmodule Appleyard.Network do
  def wifi_stats do
    with networks <- network().scan("wlan0"),
         internet <- Enum.find(networks, &(&1[:ssid] == "The Internet")) do
      extract_stats(internet)
    end
  end

  defp extract_stats(nil), do: {:unavailable}

  defp extract_stats(internet) do
    %{
      level: internet[:level],
      noise: internet[:noise],
      snr: internet[:snr]
    }
  end

  defp network do
    Application.get_env(:appleyard, :network_service)
  end
end
