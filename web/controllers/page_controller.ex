defmodule PhoenixChatExample.PageController do
  use PhoenixChatExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
