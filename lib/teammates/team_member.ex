defmodule Teammates.TeamMember do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Teammates.Repo
  alias Teammates.TeamMember
  alias Teammates.WorkingHour


  @derive {Poison.Encoder, only: [:name, :time_zone, :working_hours]}
  schema "team_members" do
    field :name, :string
    field :time_zone, :string
    has_many :working_hours, WorkingHour

    timestamps()
  end

  def all do
    query = from t in TeamMember,
      join: w in WorkingHour,
      where: w.team_member_id == t.id,
      preload: [working_hours: w]
    Repo.all(query)
  end

  def store(params) do
    %{"name" => name,
      "timeZone" => time_zone} = params

    {_, %{id: user_id} }= Repo.insert(%TeamMember{name: name, time_zone: time_zone}, returning: true)
    IO.puts('in store')
    IO.inspect(user_id)
    user_id
  end

  @doc false
  def changeset(team_member, attrs) do
    team_member
    |> cast(attrs, [:name, :time_zone])
    |> validate_required([:name, :time_zone])
  end
end
