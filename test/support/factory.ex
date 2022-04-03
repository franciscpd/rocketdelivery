defmodule Rocketlivery.Factory do
  use ExMachina

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
end
