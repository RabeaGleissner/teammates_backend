defmodule TeamMatesWeb.Router do
  use TeamMatesWeb, :router

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

  scope "/", TeamMatesWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/add_team_members", TeamMembersController, :index
  end

  scope "/api", TeamMatesWeb do
    pipe_through :api

    get "/team_mates", TeamMatesController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TeamMatesWeb do
  #   pipe_through :api
  # end
end
