defmodule AppleyardWeb.PageController do
  use AppleyardWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
