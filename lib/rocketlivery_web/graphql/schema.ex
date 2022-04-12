defmodule RocketliveryWeb.Graphql.Schema do
  use Absinthe.Schema

  alias RocketliveryWeb.Graphql.Middlewares.ErrorHandler

  import_types RocketliveryWeb.Graphql.Schema.Types.Root

  query do
    import_fields :root_query
  end

  mutation do
    import_fields :root_mutation
  end

  subscription do
    import_fields :root_subscription
  end

  def middleware(middleware, _field, %{identifier: type}) when type in [:query, :mutation] do
    middleware ++ [ErrorHandler]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
