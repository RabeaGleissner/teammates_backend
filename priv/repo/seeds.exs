alias Teammates.TeamMember
alias Teammates.WorkingHour
alias Teammates.Repo

{_, start_work} = Time.new(9, 0, 0)
{_, finish_work} = Time.new(17, 0, 0)
{_, date} = Date.new(2019, 03, 10)
{_, another_date} = Date.new(2019, 03, 11)

Repo.delete_all(WorkingHour)
Repo.delete_all(TeamMember)
%{id: fred} = Repo.insert!(%TeamMember{name: "Fred", time_zone: "DE"})
%{id: wilma} = Repo.insert!(%TeamMember{name: "Wilma", time_zone: "US"})
%{id: bamm_bamm} = Repo.insert!(%TeamMember{name: "Bamm-Bamm", time_zone: "GB"})
%{id: pebbles} = Repo.insert!(%TeamMember{name: "Pebbles", time_zone: "SG"})
%{id: barney} = Repo.insert!(%TeamMember{name: "Barney", time_zone: "GB"})
Repo.insert!(%WorkingHour{date: date, start: start_work, finish: finish_work, team_member_id: fred })
Repo.insert!(%WorkingHour{date: date, start: start_work, finish: finish_work, team_member_id: fred })
Repo.insert!(%WorkingHour{date: another_date, start: start_work, finish: finish_work, team_member_id: wilma})
Repo.insert!(%WorkingHour{date: date, start: start_work, finish: finish_work, team_member_id: bamm_bamm })
Repo.insert!(%WorkingHour{date: date, start: start_work, finish: finish_work, team_member_id: pebbles })
Repo.insert!(%WorkingHour{date: date, start: start_work, finish: finish_work, team_member_id: barney})
