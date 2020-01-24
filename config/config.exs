# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :reaction_tracker,
  ecto_repos: [ReactionTracker.Repo]

# Configures the endpoint
config :reaction_tracker, ReactionTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eoUkXg/bXYdoyrCRDaHLYkHfR57ziV4fQ8Qu4XPFct6ikyjPRLBxc9lXElIa0qiq",
  render_errors: [view: ReactionTrackerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ReactionTracker.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
