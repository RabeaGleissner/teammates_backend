defmodule TeammatesWeb.TeammatesControllerTest do
  use TeammatesWeb.ConnCase
  import Teammates.Factory

  test "gets all users" do
    conn = build_conn()
    fred = insert(:team_member)
    response = get(conn, Routes.teammates_path(conn, :index))

    assert response.status == 200
    assert json_response(response, 200) == [%{
      "name" => fred.name,
      "time_zone" => fred.time_zone
    }]
  end
end
