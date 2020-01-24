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
  def show(conn, %{"user_id" => user_id}) do
    tracker = Repo.get(Tracker, user_id)
  
    if tracker do
      
        render(conn, "show.json", tracker: tracker)
      else 
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", error: "Not Found")
    end
  end

  @doc """
  saves a new reaction in the database from a payload
  """
  def create(conn, params) do

    case ReactionTracker.save_reaction(params) do
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

  def reaction_counts(conn, %{"content_id" => content_id}) do

    if content_id do
        reaction_count = ReactionTracker.reaction_count(content_id)

        conn
        |> Conn.put_status(201)
        |> render("reaction_count.json", %{reaction_count: reaction_count, content_id: content_id})

    else
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", error: "return nothing")

    end
  end
end