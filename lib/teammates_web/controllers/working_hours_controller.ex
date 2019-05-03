defmodule TeammatesWeb.WorkingHoursController do
  use TeammatesWeb, :controller
  alias Teammates.WorkingHour

  def create(conn, params) do
    {status, number_of_records_inserted}= WorkingHour.store(params)
    json(conn, number_of_records_inserted)
  end
end
