# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :time_zones,
  ecto_repos: [TimeZones.Repo]

# Configures the endpoint
config :time_zones, TimeZonesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5RI06oOl4V29ifdeGcYPdgJtUegr5qIb/zVikzLNbXeACo4oZ9jr/niCD6A+El4O",
  render_errors: [view: TimeZonesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TimeZones.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"