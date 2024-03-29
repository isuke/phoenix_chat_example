defmodule PhoenixChatExample.Router do
  use PhoenixChatExample.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixChatExample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixChatExample do
  #   pipe_through :api
  # end

  socket "/ws", PhoenixChatExample do
    channel "rooms:*", RoomChannel
  end
end
