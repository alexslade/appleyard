defmodule AppleyardUiWeb.Router do
  use AppleyardUiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppleyardUiWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/scan", PageController, :scan
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppleyardUiWeb do
  #   pipe_through :api
  # end
end
