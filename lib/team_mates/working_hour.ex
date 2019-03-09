defmodule TeamMates.WorkingHour do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  alias TeamMates.WorkingHour
  alias TeamMates.Repo


  @derive {Poison.Encoder, only: [:date, :finish, :start]}
  schema "working_hours" do
    field :date, :date
    field :finish, :time
    field :start, :time
    belongs_to :team_member, TeamMates.TeamMember

    timestamps()
  end

  def all do
    all = Repo.all(from w in WorkingHour, order_by: w.date)
  end

  @doc false
  def changeset(working_hour, attrs) do
    working_hour
    |> cast(attrs, [:start, :end, :date])
    |> validate_required([:start, :end, :date])
  end
end
