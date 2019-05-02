defmodule Teammates.Factory do
  use ExMachina.Ecto, repo: Teammates.Repo

  def team_member_factory do
    {_, start_work} = Time.new(9, 0, 0)
    {_, finish_work} = Time.new(17, 0, 0)
    {_, date} = Date.new(2019, 03, 10)

    %Teammates.TeamMember{
      name: "Fred",
      time_zone: "US",
      working_hours: [
        %Teammates.WorkingHour{
          date: date,
          start: start_work,
          finish: finish_work,
        }
      ]
    }
  end
end
