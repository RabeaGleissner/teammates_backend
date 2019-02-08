defmodule TeamMatesWeb.TeamMembersControllerTest do
  use TeamMatesWeb.ConnCase

  test "GET /add_team_members", %{conn: conn} do
    conn = get(conn, "/add_team_members")
    assert html_response(conn, 200) =~ "Add your team members"
  end
end
