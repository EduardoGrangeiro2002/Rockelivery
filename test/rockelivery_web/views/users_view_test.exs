defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{message: "User created!", user: %Rockelivery.User{address: "Rua das bananeiras", age: 21, cep: "12830300", cpf: "32245742816", email: "edu.grangeiro2002@gmail.com", id: "2ddf0be2-1b9b-4c46-a307-6dc28c3bb45d", inserted_at: nil, name: "Eduardo", password: "123456", password_hash: nil, updated_at: nil}} == response
  end
end
