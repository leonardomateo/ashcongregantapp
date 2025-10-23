defmodule Church.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ChurchWeb.Telemetry,
      Church.Repo,
      {DNSCluster, query: Application.get_env(:church, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Church.PubSub},
      # Start a worker by calling: Church.Worker.start_link(arg)
      # {Church.Worker, arg},
      # Start to serve requests, typically the last entry
      ChurchWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Church.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChurchWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
