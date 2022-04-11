defmodule RocketliveryWeb.Graphql.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4), description: "Users id, needs to be UUID4 compliant"
    field :age, non_null(:integer), description: "Users age"
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :cpf, non_null(:string), description: "Users cpf"
    field :address, non_null(:string), description: "Users address"
    field :cep, non_null(:string), description: "Users cep"
    field :orders, list_of(:order), description: "Users orders"
    field :inserted_at, non_null(:naive_datetime), description: "Users inserted at"
    field :updated_at, non_null(:naive_datetime), description: "Users updated at"
  end

  input_object :create_user_input do
    field :age, non_null(:integer), description: "Users age"
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
    field :cpf, non_null(:string), description: "Users cpf"
    field :address, non_null(:string), description: "Users address"
    field :cep, non_null(:string), description: "Users cep"
  end
end
