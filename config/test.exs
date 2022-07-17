import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :micro_videos, MicroVideos.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "db",
  database: "micro_videos_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :micro_videos, MicroVideosWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ngHb8Gog/SuvXt1eIoGTXqlaBJYSRovsxncStdc8ThXdZjrFrxpLUNraq1DE196D",
  server: false

# In test we don't send emails.
config :micro_videos, MicroVideos.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
