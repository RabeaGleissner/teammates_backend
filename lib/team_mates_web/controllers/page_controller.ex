defmodule TeamMatesWeb.PageController do
  use TeamMatesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
