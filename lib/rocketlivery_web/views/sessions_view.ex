defmodule RocketliveryWeb.SessionsView do
  use RocketliveryWeb, :view

  def render("create.json", %{token: token}), do: %{token: token}
end
