defmodule RocketliveryWeb.UsersController do
  use RocketliveryWeb, :controller

  alias Rocketlivery.User
  alias RocketliveryWeb.{Auth.Guardian, FallbackController}

  action_fallback FallbackController

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", users: Rocketlivery.get_all_users())
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketlivery.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("create.json", token: token, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Rocketlivery.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Rocketlivery.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Rocketlivery.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
