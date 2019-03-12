defmodule TeamMates.Factory do
  use ExMachina.Ecto, repo: TeamMates.Repo

  def team_member_factory do
    %TeamMates.TeamMember{
      name: "Fred",
      time_zone: "US"
    }
  end
end
