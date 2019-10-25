defmodule AppleyardFirmware do
  @moduledoc """
  Documentation for AppleyardFirmware.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AppleyardFirmware.hello
      :world

  """
  def hello do
    :world
  end

  def wifi_stats do
    Nerves.Network.scan("wlan0")
  end
end
