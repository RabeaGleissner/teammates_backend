use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :time_zones, TimeZonesWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :time_zones, TimeZones.Repo,
  username: "postgres",
  password: "postgres",
  database: "time_zones_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
