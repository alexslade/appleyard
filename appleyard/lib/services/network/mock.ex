defmodule Services.Network.Mock do
  @use Services.Network.Behaviour

  def scan(_) do
    network_list()
    |> Enum.shuffle()
    |> Enum.take(Enum.random(0..2))
  end

  defp network_list do
    [
      %{
        level: Enum.random(-100..0),
        noise: Enum.random(-100..0),
        snr: Enum.random(-100..0),
        ssid: "Random Wifi"
      },
      %{
        level: Enum.random(-100..0),
        noise: Enum.random(-100..0),
        snr: Enum.random(-100..0),
        ssid: "The Internet"
      }
    ]
  end
end
