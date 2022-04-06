defmodule Rocketlivery.Users.Create do
  alias Rocketlivery.{Error, Repo, User}

  def call(params) do
    changeset = User.changeset(params)
    cep = Map.get(params, "cep")

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, _cep_info} <- client().get_cep_info(cep),
         {:ok, %User{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  defp client do
    :rocketlivery
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:via_cep_adapter)
  end
end
