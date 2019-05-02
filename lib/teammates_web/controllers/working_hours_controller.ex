defmodule TeammatesWeb.WorkingHoursController do
  use TeammatesWeb, :controller
  alias Teammates.WorkingHour

  def create(conn, params) do
    result = WorkingHour.store(params)
    json(conn, result)
  end
end
