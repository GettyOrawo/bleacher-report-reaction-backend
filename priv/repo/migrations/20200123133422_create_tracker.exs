defmodule ReactionTracker.Repo.Migrations.CreateTracker do
  use Ecto.Migration

  def change do
    create table(:reaction_tracker) do
      add :type, :string
      add :action, :string
      add :content_id, :string
      add :user_id, :string
      add :reaction_type, :string

      timestamps()
    end
  end
end
