defmodule ReactionTracker do
  @moduledoc """
  This is the context module where all miscelanious functions reside
  """
  alias ReactionTracker.{Cache, Repo, Server, Tracker}
  import Ecto.Query, only: [from: 2]
  import Ecto.Changeset


  @doc """
  gets the number of active reactions based on the content_id_reaction_count
  """
  def reaction_count(content_id) do

    #query database for all records with action add and given content_id
    query = from t in Tracker,
            where: t.action == "add" and
            t.content_id == ^"#{content_id}"

    query
    |> Repo.all()
    |> Enum.count
    |> to_string()

  end

  @doc """
  saves payload to database or updates if exixting
  """

  def save_reaction(params) do
    ## start caching server
    pid = Cache.start_link(params)
    
    Cache.create(pid, params)

    ##start server
    pid = ReactionTracker.Server.start_link(params)

    Server.save_reaction(pid)

  end

  def create_or_update_reaction(params) do
    #convert params map keys from strings to atoms
    params = for {key, value} <- params, into: %{}, do: {String.to_atom(key), value}

    #get reaction by its  user id
    reaction = Repo.get_by(Tracker, user_id: params.user_id)

    #Check if user has already reacted
    case reaction do

      #if user already exists update their reaction
      %Tracker{} ->
        changeset = change(reaction, params)
        Repo.update(changeset)

      #if user doesn't exists save a new reaction with received payload
      nil ->
        changeset = Tracker.changeset(%Tracker{}, params)
        Repo.insert(changeset)
    end
  end

end
