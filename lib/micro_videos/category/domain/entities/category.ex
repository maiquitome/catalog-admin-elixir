defmodule MicroVideos.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name)a
  @optional_fields ~w(active description)a

  schema "categories" do
    field :description, :string
    field :active, :boolean, default: true
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(category \\ %__MODULE__{}, attrs) do
    category
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
