defmodule TeammatesWeb.TeammatesController do
  use TeammatesWeb, :controller
  alias Teammates.TeamMember

  def index(conn, _params) do
    team_members = TeamMember.all()
    json(conn, team_members)
  end

  def create(conn, params) do
    id = TeamMember.store(params)
    json(conn, id)
  end
end
