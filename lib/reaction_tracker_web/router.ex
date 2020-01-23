defmodule ReactionTrackerWeb.Router do
  use ReactionTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ReactionTrackerWeb do
    pipe_through :api
  end
end
