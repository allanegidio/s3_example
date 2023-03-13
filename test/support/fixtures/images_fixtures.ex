defmodule S3Example.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `S3Example.Images` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        path: "some path"
      })
      |> S3Example.Images.create_image()

    image
  end
end
