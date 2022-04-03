defmodule RocketliveryWeb.WelcomeController do
  use RocketliveryWeb, :controller

  def index(conn) do
    conn
    |> put_status(:ok)
    |> text("Welcome :)")
  end
end
