defmodule S3Example.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      S3ExampleWeb.Telemetry,
      # Start the Ecto repository
      S3Example.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: S3Example.PubSub},
      # Start Finch
      {Finch, name: S3Example.Finch},
      # Start the Endpoint (http/https)
      S3ExampleWeb.Endpoint
      # Start a worker by calling: S3Example.Worker.start_link(arg)
      # {S3Example.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: S3Example.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    S3ExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
