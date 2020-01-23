defmodule ReactionTracker.Repo do
  use Ecto.Repo,
    otp_app: :reaction_tracker,
    adapter: Ecto.Adapters.Postgres
end
