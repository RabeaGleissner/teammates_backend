defmodule Teammates.WorkingHour do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Teammates.Repo
  alias Teammates.TeamMember
  alias Teammates.WorkingHour


  @derive {Poison.Encoder, only: [:date, :finish, :start]}
  schema "working_hours" do
    field :date, :date
    field :finish, :time
    field :start, :time
    belongs_to :team_member, TeamMember

    timestamps()
  end

  def by_team_member(id) do
    WorkingHour
    |> where(team_member_id: ^id)
    |> Repo.all()
  end

  def store(params) do
    %{"user_id" => user_id,
      "workingHours" => working_hours,
    } = params
    {parsed_id, _} = Integer.parse(user_id)
    Enum.each(working_hours, fn hours -> save_working_hours(hours, parsed_id) end)
  end

  def save_working_hours(%{"date" => date, "start" => start, "finish" => finish}, user_id) do
    {_, date} = Date.from_iso8601(date)
    {_, start_time} = Time.from_iso8601(start)
    {_, finish_time} = Time.from_iso8601(finish)
    Repo.insert(%WorkingHour{date: date, start: start_time, finish: finish_time, team_member_id: user_id})
  end

  @doc false
  def changeset(working_hour, attrs) do
    working_hour
    |> cast(attrs, [:start, :finish, :date])
    |> validate_required([:start, :finish, :date])
  end
end
