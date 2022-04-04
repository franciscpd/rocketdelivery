defmodule RocketliveryWeb.ItemsView do
  use RocketliveryWeb, :view

  alias Rocketlivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created successfully",
      item: item
    }
  end
end
