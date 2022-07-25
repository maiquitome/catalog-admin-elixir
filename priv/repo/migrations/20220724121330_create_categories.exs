defmodule MicroVideos.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :active, :boolean, default: true, null: false
      add :description, :string

      timestamps()
    end
  end
end
