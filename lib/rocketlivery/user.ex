defmodule Rocketlivery.User do
  use Ecto.Schema

  alias Ecto.Changeset

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:age, :address, :name, :cpf, :email, :password, :cep]

  @derive {Jason.Encoder,
           only: [:id, :age, :name, :email, :cpf, :address, :cep, :inserted_at, :updated_at]}

  schema "users" do
    field :age, :integer
    field :address, :string
    field :name, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :cep, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_length(:cpf, is: 11)
    |> validate_length(:cep, is: 8)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
