defmodule LiveViewDemoWeb.Router do
  use LiveViewDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveViewDemoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    live "/filter", FilterLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveViewDemoWeb do
  #   pipe_through :api
  # end
end
