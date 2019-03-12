defmodule Teammates.Repo do
  use Ecto.Repo,
    otp_app: :teammates,
    adapter: Ecto.Adapters.Postgres
end
