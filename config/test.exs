import Config

config :rocketlivery, Rocketlivery.Users.Create, via_cep_adapter: Rocketlivery.ViaCep.ClientMock

config :rocketlivery, Rocketlivery.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "rocketlivery_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :rocketlivery, RocketliveryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "KcD1GNW/0qFA0QTekQLtOJnyd/1bbEp0Gq8hjI/9n4ShF2Zu8Wq5uSkQWKoVxYl5",
  server: false

# In test we don't send emails.
config :rocketlivery, Rocketlivery.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
