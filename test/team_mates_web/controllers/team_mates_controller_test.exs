defmodule TeamMatesWeb.TeamMatesControllerTest do
  use TeamMatesWeb.ConnCase
  import TeamMates.Factory

  test "gets all users" do
    conn = build_conn()
    fred = insert(:team_member)
    response = get(conn, Routes.team_mates_path(conn, :index))

    assert response.status == 200
    assert json_response(response, 200) == [%{
      "name" => fred.name,
      "time_zone" => fred.time_zone
    }]
  end
end
