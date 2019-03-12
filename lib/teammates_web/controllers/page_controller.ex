defmodule TeammatesWeb.PageController do
  use TeammatesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
