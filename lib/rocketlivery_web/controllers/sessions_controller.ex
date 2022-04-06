defmodule RocketliveryWeb.SessionsController do
  use RocketliveryWeb, :controller

  alias RocketliveryWeb.Auth.Guardian

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", token: token)
    end
  end
end
