defmodule RocketliveryWeb.Graphql.Resolvers.User do
  # alias Absinthe.Subscription

  alias Rocketlivery.Users

  # alias RocketliveryWeb.Endpoint
  alias RocketliveryWeb.Graphql.Utils.AtomToKey

  def create(%{input: params}, _context), do: params |> AtomToKey.call() |> Users.Create.call()

  # def create(%{input: params}, _context) do
  #   with {:ok, user} <-
  #          params
  #          |> AtomToKey.call()
  #          |> Users.Create.call() do
  #     Subscription.publish(Endpoint, user, new_user: "new_user_topic")

  #     {:ok, user}
  #   end
  # end

  def delete(%{id: user_id}, _context), do: Users.Delete.call(user_id)

  def get(%{id: user_id}, _context), do: Users.Get.by_id(user_id)

  def get_all(_params, _context), do: Users.Get.all()
end
