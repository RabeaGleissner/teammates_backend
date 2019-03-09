defmodule TeamMates.TeamMember do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias TeamMates.Repo
  alias TeamMates.TeamMember


  @derive {Poison.Encoder, only: [:name, :time_zone]}
  schema "team_members" do
    field :name, :string
    field :time_zone, :string
    has_many :working_hours, TeamMates.WorkingHour

    timestamps()
  end

  def all do
    all = Repo.all(from t in TeamMember, order_by: t.name)
  end

  @doc false
  def changeset(team_member, attrs) do
    team_member
    |> cast(attrs, [:name, :time_zone])
    |> validate_required([:name, :time_zone])
  end
end
