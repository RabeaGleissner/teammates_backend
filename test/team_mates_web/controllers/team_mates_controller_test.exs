defmodule TeammatesWeb.TeammatesControllerTest do
  use ExUnit.Case, async: true
  use TeammatesWeb.ConnCase
  import Teammates.Factory
  alias Teammates.TeamMember
  alias Teammates.Repo

  test "creates team member" do
    conn = post(build_conn(), "/api/teammates", [name: "Fred", timeZone: "US"])
    all_team_members = TeamMember.all()

    assert conn.status == 200
    assert length(all_team_members) == 1
    assert all_team_members[0]["name"] == "Fred"
  end

  test "gets all users" do
    conn = build_conn()
    fred = insert(:team_member)
    response = get(conn, "/api/teammates")

    assert response.status == 200
    assert json_response(response, 200) == [%{
      "name" => fred.name,
      "time_zone" => fred.time_zone
    }]
  end
end
