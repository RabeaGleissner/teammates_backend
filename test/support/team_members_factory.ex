defmodule TeamMates.Test.Support.TeamMembersFactory do
  alias TeamMates.TeamMember
  alias TeamMates.WorkingHour

  #@team_members [
    #%TeamMember{name: "Fred", time_zone: "DE"},
    #%TeamMember{name: "Wilma", time_zone: "US"},
    #%TeamMember{name: "Barney", time_zone: "GB"}
  #]

  #@working_hours [
    #%WorkingHour{date: Date.utc_today(), start: Time.utc_now(), finish: Time.utc_now()},
    #%WorkingHour{date: Date.utc_today(), start: Time.utc_now(), finish: Time.utc_now()},
    #%WorkingHour{date: Date.utc_today(), start: Time.utc_now(), finish: Time.utc_now()}
  #]

  #def add(name) do
    #@team_members
    #|> Enum.find(fn(t) -> t.name == name end)
    #|> TeamMates.Repo.insert!()
  #end
end
