defmodule ChessHub.GameTest do
  use ChessHub.ModelCase

  alias ChessHub.Game

  @valid_attrs %{black: "some content", date: "2010-04-17", event: "some content", moves: "some content", round: 42, site: "some content", white: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Game.changeset(%Game{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Game.changeset(%Game{}, @invalid_attrs)
    refute changeset.valid?
  end
end
