{_, start_work} = Time.new(9, 0, 0)
{_, finish_work} = Time.new(17, 0, 0)
TeamMates.Repo.insert!(%TeamMates.TeamMember{name: "Fred", time_zone: "DE"})
TeamMates.Repo.insert!(%TeamMates.TeamMember{name: "Wilma", time_zone: "US"})
TeamMates.Repo.insert!(%TeamMates.TeamMember{name: "Bamm-Bamm", time_zone: "GB"})
TeamMates.Repo.insert!(%TeamMates.TeamMember{name: "Pebbles", time_zone: "SG"})
TeamMates.Repo.insert!(%TeamMates.TeamMember{name: "Barney", time_zone: "GB"})
