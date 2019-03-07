defmodule TeamMates.TeamMember do
  use Ecto.Schema
  import Ecto.Changeset


  schema "team_members" do
    field :name, :string
    field :time_zone, :string
    has_many :working_hours, TeamMates.WorkingHour

    timestamps()
  end

  @doc false
  def changeset(team_member, attrs) do
    team_member
    |> cast(attrs, [:name, :time_zone])
    |> validate_required([:name, :time_zone])
  end
end
