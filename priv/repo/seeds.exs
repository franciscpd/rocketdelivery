# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rocketlivery.Repo.insert!(%Rocketlivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rocketlivery.{Item, Order, Repo, User}

user = %User{
  age: 35,
  address: "Rua Coronel João Camilo, 542",
  cep: "14050040",
  cpf: "22760306070",
  password: "123456",
  name: "João da Silva",
  email: "joao@silva.com"
}

%User{id: user_id} = Repo.insert!(user)

item1 = %Item{
  category: :food,
  description: "banana frita",
  price: Decimal.new("15.50"),
  photo: "priv/photos/banana_frita.jpg"
}

item2 = %Item{
  category: :food,
  description: "banana assada",
  price: Decimal.new("10.50"),
  photo: "priv/photos/banana_assada.jpg"
}

Repo.insert!(item1)
Repo.insert!(item2)

order = %Order{
  user_id: user_id,
  items: [item1, item1, item2],
  address: "Rua Coronel João Camilo, 542",
  comments: "Por favor, leve em casa",
  payment_method: :credit_card
}

Repo.insert!(order)
