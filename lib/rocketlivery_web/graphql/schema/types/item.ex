defmodule RocketliveryWeb.Graphql.Schema.Types.Item do
  use Absinthe.Schema.Notation

  enum :item_category, values: [:food, :drink, :desert]

  @desc "Logic item representation"
  object :item do
    field :id, non_null(:uuid4), description: "Items id, needs to be UUID4 compliant"
    field :category, non_null(:item_category), description: "Items category"
    field :description, non_null(:string), description: "Items description"
    field :price, non_null(:decimal), description: "Items price"
    field :photo, non_null(:string), description: "Items photo"
    field :inserted_at, non_null(:naive_datetime), description: "Orders inserted at"
    field :updated_at, non_null(:naive_datetime), description: "Orders updated at"
  end
end
