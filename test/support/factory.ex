defmodule Rocketlivery.Factory do
  use ExMachina.Ecto, repo: Rocketlivery.Repo

  alias Rocketlivery.User

  def user_params_factory do
    %{
      age: 26,
      address: "Rua Canto do Vaqueiro, 943",
      cep: "56317160",
      cpf: "86000376545",
      email: "beneditomarcoscavalcanti@vasconcelosdias.com",
      name: "Benedito Marcos Enrico Cavalcanti",
      password: "123456"
    }
  end

  def user_factory do
    %User{
      age: 26,
      address: "Rua Canto do Vaqueiro, 943",
      cep: "56317160",
      cpf: "86000376545",
      email: "beneditomarcoscavalcanti@vasconcelosdias.com",
      name: "Benedito Marcos Enrico Cavalcanti",
      password: "123456",
      id: "aaee3d27-f528-488c-a353-83bbe5b02436"
    }
  end
end
