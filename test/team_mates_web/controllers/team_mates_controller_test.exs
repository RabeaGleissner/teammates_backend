defmodule TeammatesWeb.TeammatesControllerTest do
  use ExUnit.Case, async: true
  use TeammatesWeb.ConnCase
  import Teammates.Factory
  alias Teammates.TeamMember

  test "creates team member" do
    conn = post(build_conn(), "/api/teammates", [
      name: "Fred",
      timeZone: "US",
    ])
    [fred | _others] = TeamMember.all()

    assert conn.status == 200
    assert fred.name == "Fred"
    assert fred.time_zone == "US"
  end

  test "creates several team members"


  test "gets all users with working hours" do
    conn = build_conn()
    fred = insert(:team_member_with_hours)
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
