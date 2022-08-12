defmodule Rockelivery.Factory do
  use ExMachina

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
end
