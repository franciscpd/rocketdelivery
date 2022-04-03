defmodule RocketliveryWeb.UsersView do
  use RocketliveryWeb, :view

  alias Rocketlivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created successfully",
      user: user
    }
  end
end
