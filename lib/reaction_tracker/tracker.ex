defmodule ReactionTracker.Tracker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reaction_tracker" do
    field :type, :string
    field :action, :string
    field :content_id, :string
    field :user_id, :string
    field :reaction_type, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the Struct and Params
  """

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type,:action, :content_id, :user_id, :reaction_type])
    |> validate_required([:type,:action, :content_id, :user_id, :reaction_type])
  end
end