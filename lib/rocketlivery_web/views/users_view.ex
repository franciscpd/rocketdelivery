defmodule RocketliveryWeb.UsersView do
  use RocketliveryWeb, :view

  alias Rocketlivery.User

  def render("index.json", %{users: users}), do: %{users: users}

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created successfully",
      user: user,
      token: token
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
