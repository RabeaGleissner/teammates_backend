defmodule TeammatesWeb.WorkingHoursControllerTest do
  use ExUnit.Case, async: true
  use TeammatesWeb.ConnCase
  import Teammates.Factory
  alias Teammates.WorkingHour

  test "does not add working hours if team member does not exist"

  test "adds working hours for existing team member" do
    work_date = "2019-03-10"
    start_work = "09:00:00"
    finish_work = "17:00:00"
    conn = build_conn()
    fred = insert(:team_member)
    conn = post(conn, "/api/working_hours/#{fred.id}", [
      workingHours: [
        %{:date => work_date, :start => start_work, :finish => finish_work}
      ]
    ])

    freds_hours = WorkingHour.by_team_member(fred.id)
    IO.inspect(freds_hours)
    assert conn.status == 200
    assert length(freds_hours) == 1
  end
end
