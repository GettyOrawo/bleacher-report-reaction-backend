defmodule ReactionTracker do
  @moduledoc """
  This is the context module where all miscelanious functions reside
  """
  alias ReactionTracker.{Repo, Tracker}
  import Ecto.Query, only: [from: 2]
  
  @doc """
  gets the number of active reactions based on the content_id_reaction_count
  """
  def reaction_count(content_id) do
    

    query = from t in Tracker,
            where: t.action == "add" and 
            t.content_id == ^"#{content_id}"

    query
    |> Repo.all()
    |> Enum.count
    |> to_string()
   
  end

end