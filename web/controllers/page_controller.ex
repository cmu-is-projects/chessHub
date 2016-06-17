defmodule ChessHubAPI.PageController do
  use ChessHubAPI.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
