defmodule TeammatesWeb.Router do
  use TeammatesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TeammatesWeb do
    pipe_through :api

    get "/teammates", TeammatesController, :index
    post "/teammates", TeammatesController, :create
    post "/working_hours/:user_id", WorkingHoursController, :create
  end
end
