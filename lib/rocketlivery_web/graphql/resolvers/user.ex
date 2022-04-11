defmodule RocketliveryWeb.Graphql.Resolvers.User do
  alias Rocketlivery.Users
  alias RocketliveryWeb.Graphql.Utils.AtomToKey

  def create(%{input: params}, _context), do: params |> AtomToKey.call() |> Users.Create.call()

  def delete(%{id: user_id}, _context), do: Users.Delete.call(user_id)

  def get(%{id: user_id}, _context), do: Users.Get.by_id(user_id)

  def get_all(_params, _context), do: Users.Get.all()
end
