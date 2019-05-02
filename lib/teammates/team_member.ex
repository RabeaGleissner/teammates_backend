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
    everything = from(t in TeamMember)
                 |> Repo.all()
                 |> Repo.preload(working_hours: :team_member)
  end

  def store(params) do
    %{"name" => name,
      "workingHours" => working_hours,
      "timeZone" => time_zone} = params
    [%{"date" => date,
      "start" => start,
      "finish" => finish
    }] = working_hours
    insertable_date = Date.from_iso8601(date)

    {_, %{id: user_id} } = Repo.insert(%TeamMember{name: name, time_zone: time_zone}, returning: true)
    {_, date} = Date.from_iso8601(date)
    {_, start_time} = Time.from_iso8601(start)
    {_, finish_time} = Time.from_iso8601(finish)

    {_, %{id: user_id} } = Repo.insert(%WorkingHour{
      date: date,
      start: start_time,
      finish: finish_time,
      team_member_id: user_id
    }, returning: true)
    user_id
  end

  @doc false
  def changeset(team_member, attrs) do
    team_member
    |> cast(attrs, [:name, :time_zone])
    |> validate_required([:name, :time_zone])
  end
end
