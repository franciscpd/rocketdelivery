defmodule Rocketlivery.Users.Get do
  alias Rocketlivery.{Error, Repo, User}

  def all do
    users =
      User
      |> Repo.all()
      |> Repo.preload([{:orders, :items}])

    {:ok, users}
  end

  def by_id(id) do
    user =
      User
      |> Repo.get(id)
      |> Repo.preload([{:orders, :items}])

    case user do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end

  def by_email(email) do
    user =
      User
      |> Repo.get_by(email: email)
      |> Repo.preload([{:orders, :items}])

    case user do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
