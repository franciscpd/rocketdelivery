defmodule Rocketlivery.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Rocketlivery.Repo,
      # Start the Telemetry supervisor
      RocketliveryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rocketlivery.PubSub},
      # Start the Endpoint (http/https)
      RocketliveryWeb.Endpoint,
      # Start the ReportRunner
      Rocketlivery.Orders.ReportRunner,
      {Absinthe.Subscription, RocketliveryWeb.Endpoint}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rocketlivery.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RocketliveryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
