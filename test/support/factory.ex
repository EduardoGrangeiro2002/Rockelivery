defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo
  alias Rockelivery.User

  def user_params_factory() do
    %{
      age: 21,
      address: "Rua das bananeiras",
      cpf: "32245742816",
      cep: "12830300",
      email: "edu.grangeiro2002@gmail.com",
      password: "123456",
      name: "Eduardo"
    }
  end

  def user_factory do
    %User{
      age: 21,
      address: "Rua das bananeiras",
      cpf: "32245742816",
      cep: "12830300",
      email: "edu.grangeiro2002@gmail.com",
      password: "123456",
      name: "Eduardo",
      id: "2ddf0be2-1b9b-4c46-a307-6dc28c3bb45d"
    }
  end
end
