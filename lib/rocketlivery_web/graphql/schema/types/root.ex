defmodule RocketliveryWeb.Graphql.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias RocketliveryWeb.Graphql.Resolvers.User, as: UsersResolver

  import_types Absinthe.Type.Custom
  import_types RocketliveryWeb.Graphql.Schema.Types.Custom.UUID4
  import_types RocketliveryWeb.Graphql.Schema.Types.User
  import_types RocketliveryWeb.Graphql.Schema.Types.Item
  import_types RocketliveryWeb.Graphql.Schema.Types.Order

  object :root_query do
    @desc "Get all users"
    field :users, type: list_of(:user) do
      resolve &UsersResolver.get_all/2
    end

    @desc "Get a user by id"
    field :user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UsersResolver.get/2
    end
  end

  object :root_mutation do
    @desc "Create a new user"
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UsersResolver.create/2
    end

    @desc "Deletes user"
    field :delete_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UsersResolver.delete/2
    end
  end
end
