defmodule ReactionTrackerWeb.TrackerController do
  use ReactionTrackerWeb, :controller

  alias ReactionTracker.{ErrorView, Repo, Tracker}
  alias Plug.Conn

  @doc """
  displays all the tracked reactions in JSON
  """
  def index(conn, _params) do
    trackers = Repo.all(Tracker)
    render(conn, "index.json", trackers: trackers)
  end

  @doc """
  saves a new reaction in the database from a payload
  """
  def show(conn, %{"id" => user_id}) do
  
    case Repo.get(Tracker, user_id) do
      {:ok, tracker} -> 
        render(conn, "show.json", tracker: tracker)
      nil -> 
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", error: "Not Found")
    end
  end
end