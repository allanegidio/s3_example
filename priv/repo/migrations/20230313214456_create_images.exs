defmodule S3Example.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :name, :string
      add :description, :string
      add :path, :string

      timestamps()
    end
  end
end
