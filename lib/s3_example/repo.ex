defmodule S3Example.Repo do
  use Ecto.Repo,
    otp_app: :s3_example,
    adapter: Ecto.Adapters.Postgres
end
