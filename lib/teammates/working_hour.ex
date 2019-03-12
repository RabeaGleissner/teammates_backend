defmodule Teammates.WorkingHour do
  use Ecto.Schema
  import Ecto.Changeset
  alias Teammates.TeamMember


  @derive {Poison.Encoder, only: [:date, :finish, :start]}
  schema "working_hours" do
    field :date, :date
    field :finish, :time
    field :start, :time
    belongs_to :team_member, TeamMember

    timestamps()
  end

  @doc false
  def changeset(working_hour, attrs) do
    working_hour
    |> cast(attrs, [:start, :finish, :date])
    |> validate_required([:start, :finish, :date])
  end
end
