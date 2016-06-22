defmodule ChessHub.GameView do
  use ChessHub.Web, :view

  def render("index.json", %{games: games}) do
    %{data: render_many(games, ChessHub.GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, ChessHub.GameView, "game.json")}
  end

  def render("show_moves.json", %{game: game}) do
    %{data: render_one(game, ChessHub.GameView, "move.json")}
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
    %{moves: game.moves}
  end
end
