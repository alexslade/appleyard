defmodule AppleyardUiWeb.PageController do
  use AppleyardUiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def scan(conn, _params) do
    stats = AppleyardFirmware.wifi_stats()
    render(conn, "scan.html", stats: stats)
  end
end
