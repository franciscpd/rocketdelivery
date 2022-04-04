defmodule RocketliveryWeb.OrdersView do
  use RocketliveryWeb, :view

  alias Rocketlivery.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created successfully",
      order: order
    }
  end
end
