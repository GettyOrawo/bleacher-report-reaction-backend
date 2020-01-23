defmodule ReactionTrackerWeb.TrackerController do
  use ReactionTrackerWeb, :controller

  alias ReactionTracker.{Repo, Tracker}

  @doc """
  displays all the tracked reactions in JSON
  """
  def index(conn, _params) do
    trackers = Repo.all(Tracker)
    render(conn, "index.json", trackers: trackers)
  end
end