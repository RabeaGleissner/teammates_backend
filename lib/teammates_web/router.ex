defmodule TeammatesWeb.Router do
  use TeammatesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TeammatesWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/add_team_members", TeamMembersController, :index
  end

  scope "/api", TeammatesWeb do
    pipe_through :api

    get "/teammates", TeammatesController, :index
    post "/teammates", TeammatesController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", TeammatesWeb do
  #   pipe_through :api
  # end
end
