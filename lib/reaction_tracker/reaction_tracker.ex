defmodule ReactionTracker do
  @moduledoc """
  This is the context module where all miscelanious functions reside
  """
  alias ReactionTracker.{Repo, Tracker}
  import Ecto.Query, only: [from: 2]
  import Ecto.Changeset

  
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

  def save_reaction(params) do
    
    %{"user_id" => user_id, 
      "type" => type,
      "action" => action,
      "content_id" => content_id,
      "reaction_type" => reaction_type

      } = params

      params = %{
        user_id: user_id,
        type: type,
        action: action,
        content_id: content_id,
        reaction_type: reaction_type
      }

    case Repo.get_by(Tracker, user_id: user_id) do
      reaction -> 
        changeset = change(%Tracker{}, params)
        Repo.insert(changeset)


      nil ->
        changeset = Tracker.changeset(%Tracker{}, params)
        Repo.insert(changeset)
    end
  end

end