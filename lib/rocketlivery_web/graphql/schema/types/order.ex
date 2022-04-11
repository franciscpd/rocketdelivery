defmodule RocketliveryWeb.Graphql.Schema.Types.Order do
  use Absinthe.Schema.Notation

  enum :payment_methods, values: [:money, :credit_card, :debit_card]

  @desc "Logic order representation"
  object :order do
    field :id, non_null(:uuid4), description: "Orders id, needs to be UUID4 compliant"
    field :payment_method, non_null(:payment_methods), description: "Orders payment method"
    field :address, non_null(:string), description: "Orders address"
    field :comments, non_null(:string), description: "Orders comments"
    field :items, list_of(:item), description: "Orders items"
    field :inserted_at, non_null(:naive_datetime), description: "Orders inserted at"
    field :updated_at, non_null(:naive_datetime), description: "Orders updated at"
  end
end
