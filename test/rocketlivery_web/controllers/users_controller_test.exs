defmodule RocketliveryWeb.UsersControllerTest do
  use RocketliveryWeb.ConnCase, async: true

  import Rocketlivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 26,
        "address" => "Rua Canto do Vaqueiro, 943",
        "cep" => "56317160",
        "cpf" => "86000376545",
        "email" => "beneditomarcoscavalcanti@vasconcelosdias.com",
        "name" => "Benedito Marcos Enrico Cavalcanti",
        "password" => "123456"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created successfully",
               "user" => %{
                 "address" => "Rua Canto do Vaqueiro, 943",
                 "age" => 26,
                 "cep" => "56317160",
                 "cpf" => "86000376545",
                 "email" => "beneditomarcoscavalcanti@vasconcelosdias.com",
                 "id" => _id,
                 "name" => "Benedito Marcos Enrico Cavalcanti"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "name" => "Benedito Marcos Enrico Cavalcanti",
        "password" => "123456"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "aaee3d27-f528-488c-a353-83bbe5b02436"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
