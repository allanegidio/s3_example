defmodule S3Example.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :description, :string
    field :name, :string
    field :path, :string
    field :file, :binary, virtual: true

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:name, :description, :path])
    |> validate_required([:name, :description, :path])
  end
end
