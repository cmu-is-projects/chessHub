defmodule ChessHub.Game do
  use ChessHub.Web, :model

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
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required([:white, :black, :event, :site, :date, :round, :moves])
  end

  def get_moves_array() do
    String.split(:moves,",")
  end

  defimpl Poison.Encoder, for: ChessHub.Game do
    def encode(game, _options) do
      game
      |> Map.from_struct
      |> Map.drop([:__meta__, :__struct__])
      |> Poison.encode!
    end
  end
end
