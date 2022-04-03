defmodule Rocketlivery.UserTest do
  use Rocketlivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rocketlivery.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 26,
        address: "Rua Canto do Vaqueiro, 943",
        cep: "56317160",
        cpf: "86000376545",
        email: "beneditomarcoscavalcanti@vasconcelosdias.com",
        name: "Benedito Marcos Enrico Cavalcanti",
        password: "123456"
      }

      response = User.changeset(params)

      assert %Changeset{
               changes: %{name: "Benedito Marcos Enrico Cavalcanti"},
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        age: 15,
        address: "Rua Canto do Vaqueiro, 943",
        cep: "56317160",
        cpf: "86000376545",
        email: "beneditomarcoscavalcanti@vasconcelosdias.com",
        name: "Benedito Marcos Enrico Cavalcanti",
        password: "123"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end

  describe "changeset/2" do
    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        age: 26,
        address: "Rua Canto do Vaqueiro, 943",
        cep: "56317160",
        cpf: "86000376545",
        email: "beneditomarcoscavalcanti@vasconcelosdias.com",
        name: "Benedito Marcos Enrico Cavalcanti",
        password: "123456"
      }

      update_params = %{name: "Francisross Soares de Oliveira"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{
               changes: %{name: "Francisross Soares de Oliveira"},
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        age: 26,
        address: "Rua Canto do Vaqueiro, 943",
        cep: "56317160",
        cpf: "86000376545",
        email: "beneditomarcoscavalcanti@vasconcelosdias.com",
        name: "Benedito Marcos Enrico Cavalcanti",
        password: "123456"
      }

      update_params = %{cep: "12345"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      expected_response = %{cep: ["should be 8 character(s)"]}

      assert errors_on(response) == expected_response
    end
  end
end
