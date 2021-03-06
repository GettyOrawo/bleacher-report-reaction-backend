defmodule ReactionTrackerWeb.Router do
  use ReactionTrackerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ReactionTrackerWeb do
    pipe_through :api

    get "/reaction", TrackerController, :index
    get "/reaction/:user_id", TrackerController, :show
    post "/reaction", TrackerController, :create
    get "/reaction_counts/:content_id", TrackerController, :reaction_counts, param: "content_id"
  end
end
