defmodule ReactionTracker do
  @moduledoc """
  This is the context module where all miscelanious functions reside
  """
  alias ReactionTracker.{Repo, Tracker}
  import Ecto.Query, only: [from: 2]
  
  @doc """
  gets the number of active reactions based on the content_id_reaction_count
  """
  def  content_id_reaction_count(content_id) do

    query = from t in Tracker,
            where: t.action == ^"add" and 
            t.content_id == ^content_id

    Repo.all(query)
    |> Enum.count
    |> to_string()
   
  end

  @doc """
  groups reaction content by content_id and count based on a particular content_id
  """
  def reaction_count_by_content_id(content_id) do
    %{content_id: content_id, reaction_count: content_id_reaction_count(content_id)}
  end

end