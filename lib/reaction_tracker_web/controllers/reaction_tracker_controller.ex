defmodule ReactionTrackerWeb.TrackerController do
  use ReactionTrackerWeb, :controller

  alias ReactionTracker.{Repo, Tracker}
  alias ReactionTrackerWeb.ErrorView
  alias Plug.Conn

  @doc """
  displays all the tracked reactions in JSON
  """
  def index(conn, _params) do
    trackers = Repo.all(Tracker)
    render(conn, "index.json", trackers: trackers)
  end

  @doc """
  shows a single new reaction after it's saved in the database from a payload
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

  @doc """
  saves a new reaction in the database from a payload
  """
  def create(conn, params) do
    changeset = Tracker.changeset(%Tracker{}, params)

    case Repo.insert(changeset) do
      {:ok, tracker} -> 
        conn
        |> Conn.put_status(201)
        |> render("show.json", tracker: tracker)
      {:error, %{errors: errors}} -> 
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end
  end
end