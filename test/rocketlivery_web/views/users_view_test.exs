defmodule RocketliveryWeb.UsersViewTest do
  use RocketliveryWeb.ConnCase, async: true

  alias RocketliveryWeb.UsersView

  import Phoenix.View
  import Rocketlivery.Factory

  test "renders create.json" do
    user = build(:user)
    token = "token"

    response = render(UsersView, "create.json", user: user, token: token)

    assert %{
             message: "User created successfully",
             token: "token",
             user: %Rocketlivery.User{
               address: "Rua Canto do Vaqueiro, 943",
               age: 26,
               cep: "56317160",
               cpf: "86000376545",
               email: "beneditomarcoscavalcanti@vasconcelosdias.com",
               id: "aaee3d27-f528-488c-a353-83bbe5b02436",
               inserted_at: nil,
               name: "Benedito Marcos Enrico Cavalcanti",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end

  test "renders user.json" do
    user = build(:user)

    response = render(UsersView, "user.json", user: user)

    assert %{
             user: %Rocketlivery.User{
               address: "Rua Canto do Vaqueiro, 943",
               age: 26,
               cep: "56317160",
               cpf: "86000376545",
               email: "beneditomarcoscavalcanti@vasconcelosdias.com",
               id: "aaee3d27-f528-488c-a353-83bbe5b02436",
               inserted_at: nil,
               name: "Benedito Marcos Enrico Cavalcanti",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
