defmodule TimeZonesWeb.PageController do
  use TimeZonesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
