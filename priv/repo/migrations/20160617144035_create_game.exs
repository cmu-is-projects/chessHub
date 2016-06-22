defmodule ChessHub.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :white, :string
      add :black, :string
      add :event, :string
      add :site, :string
      add :date, :date
      add :round, :integer
      add :moves, :text

      timestamps
    end

  end
end
