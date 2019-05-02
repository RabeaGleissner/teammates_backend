defmodule TeammatesWeb.TeammatesControllerTest do
  use ExUnit.Case, async: true
  use TeammatesWeb.ConnCase
  import Teammates.Factory
  alias Teammates.TeamMember

  test "creates team member" do
    work_date = "2019-03-10"
    start_work = "09:00:00"
    finish_work = "17:00:00"
    conn = post(build_conn(), "/api/teammates", [
      name: "Fred",
      timeZone: "US",
      workingHours: [
        %{:date => work_date, :start => start_work, :finish => finish_work},
      ]
    ])
    [fred | _others] = TeamMember.all()

    assert conn.status == 200
    assert fred.name == "Fred"
    assert fred.time_zone == "US"
    [%{date: date, start: start, finish: finish}] = fred.working_hours
    {_, expected_date} = Date.from_iso8601(work_date)
    {_, expected_start} = Time.from_iso8601(start_work)
    {_, expected_finish} = Time.from_iso8601(finish_work)
    assert date == expected_date
    assert start == expected_start
    assert finish == expected_finish
  end

  #create team member with several working hours

  test "gets all users" do
    conn = build_conn()
    fred = insert(:team_member)
    [%{date: date, start: start, finish: finish}] = fred.working_hours
    response = get(conn, "/api/teammates")

    assert response.status == 200
    assert json_response(response, 200) == [%{
      "name" => fred.name,
      "time_zone" => fred.time_zone,
      "working_hours" => [
        %{
          "date" => Date.to_iso8601(date),
          "finish" => Time.to_iso8601(finish),
          "start" => Time.to_iso8601(start)
        }
      ]
    }]
  end
end
