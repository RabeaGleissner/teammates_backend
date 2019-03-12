defmodule Teammates.Factory do
  use ExMachina.Ecto, repo: Teammates.Repo

  def team_member_factory do
    %Teammates.TeamMember{
      name: "Fred",
      time_zone: "US"
    }
  end
end
