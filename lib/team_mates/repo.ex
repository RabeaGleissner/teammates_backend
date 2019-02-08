defmodule TeamMates.Repo do
  use Ecto.Repo,
    otp_app: :team_mates,
    adapter: Ecto.Adapters.Postgres
end
