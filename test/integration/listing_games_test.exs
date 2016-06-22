defmodule ListingGamesIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias ChessHubAPI.Router
  alias ChessHubAPI.Game
  alias ChessHubAPI.Repo

  @opts Router.init([])
  test 'listing games' do
    %Game{
      white: "Prof. H",
      black: "Watson",
      event: "Event 1",
      site: "Site 1",
      date: %Ecto.Date{day: 29, month: 11, year: 2014},
      round: 1,
      moves: "1. e4 e5 2. Nf3 Nc6"}
    |> Repo.insert!
    games = Repo.all(Game)
    |> Poison.encode!

    conn = conn(:get, "/api/games")
    response = Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body == games
  end
end
# defmodule ListingGamesIntegrationTest do
#   use ExUnit.Case, async: true
#   use Plug.Test
#   alias ChessHubAPI.Router
#
#   @opts Router.init([])
#   test 'listing games' do
#     conn = conn(:get, "/api/games")
#     response = Router.call(conn, @opts)
#     assert response.status == 200
#   end
# end
