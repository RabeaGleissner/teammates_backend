defmodule TeamMatesWeb.TeamMatesController do
  use TeamMatesWeb, :controller
  alias TeamMates.TeamMember
  alias TeamMates.WorkingHour

  def index(conn, _params) do
    team_members = TeamMember.all()
    json(conn, team_members)
  end
end
