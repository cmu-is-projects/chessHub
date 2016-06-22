defmodule ChessHub.PageController do
  use ChessHub.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
