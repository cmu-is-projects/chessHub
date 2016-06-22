defmodule ChessHubAPI.GameView do
  use ChessHubAPI.Web, :view

  def render("index.json", %{games: games}) do
    %{data: render_many(games, ChessHubAPI.GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, ChessHubAPI.GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{id: game.id,
      white: game.white,
      black: game.black,
      event: game.event,
      site: game.site,
      date: game.date,
      round: game.round,
      moves: game.moves}
  end

  def render("move.json", %{game: game}) do
    %{moves: game}
  end
end
