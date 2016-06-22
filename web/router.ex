defmodule ChessHubAPI.Router do
  use ChessHubAPI.Web, :router

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

  scope "/", ChessHubAPI do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/games", GameHTMLController
  end

  # Other scopes may use custom stacks.
  scope "/api", ChessHubAPI do
    pipe_through :api

    resources "/games", GameController do
      get "/moves", GameController, :show_moves
    end

    # scope "/v1", V1, as: :v1 do
    #   resources "/games", GameController
    # end
  end
end
