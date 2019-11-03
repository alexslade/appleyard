defmodule Services.Network.Behavior do
  @callback scan(String.t()) :: tuple()
end
