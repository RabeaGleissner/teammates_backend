defmodule TimeZones.Repo do
  use Ecto.Repo,
    otp_app: :time_zones,
    adapter: Ecto.Adapters.Postgres
end
