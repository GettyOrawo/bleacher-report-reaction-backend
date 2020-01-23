defmodule ReactionTrackerWeb.Router do
  use ReactionTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ReactionTrackerWeb do
    pipe_through :api

    get "/", TrackerController, :index
  end
end
