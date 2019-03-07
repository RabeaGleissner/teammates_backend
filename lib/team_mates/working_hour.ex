defmodule TeamMates.WorkingHour do
  use Ecto.Schema
  import Ecto.Changeset


  schema "working_hours" do
    field :date, :date
    field :finish, :time
    field :start, :time
    field :user_id, :id
    belongs_to :team_member, TeamMates.TeamMember

    timestamps()
  end

  @doc false
  def changeset(working_hour, attrs) do
    working_hour
    |> cast(attrs, [:start, :end, :date])
    |> validate_required([:start, :end, :date])
  end
end
