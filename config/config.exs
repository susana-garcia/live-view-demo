# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :live_view_demo,
  ecto_repos: [LiveViewDemo.Repo]

# Configures the endpoint
config :live_view_demo, LiveViewDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OQ0g454ERIiNq0tjsKKS148aPzrCrfa7HAPPAIgCBxpZlxV6bQNgCeJsTJzGgL+P",
  render_errors: [view: LiveViewDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveViewDemo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
