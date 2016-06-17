defmodule ChessHubAPI.Game do
  use ChessHubAPI.Web, :model

  schema "games" do
    field :white, :string
    field :black, :string
    field :event, :string
    field :site, :string
    field :date, Ecto.Date
    field :round, :integer
    field :moves, :string

    timestamps
  end

  @required_fields ~w(white black event site date round moves)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
