defmodule AppleyardFirmware.WifiStatsServer do
  use GenServer

  # API
  def start_link() do
    GenServer.start_link(__MODULE__, :unavailable, name: :wifi_stats_server)
  end

  def get_stats do
    GenServer.call(:wifi_stats_server, :get_stats)
  end

  # SERVER
  def init(stats) do
    {:ok, stats}
  end

  def handle_call(:get_stats, _from, stats) do
    {:reply, stats, stats}
  end
end
