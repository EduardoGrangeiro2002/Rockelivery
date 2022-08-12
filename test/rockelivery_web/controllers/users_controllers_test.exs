defmodule RockeliveryWeb.UsersControllersTest do
  use RockeliveryWeb.ConnCase, async: true
  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params =
        %{
        "age" => 21,
        "address" => "Rua das bananeiras",
        "cpf" => "32245742816",
        "cep" => "12830300",
        "email" => "edu.grangeiro2002@gmail.com",
        "password" => "123456",
        "name" => "Eduardo"
      }
      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

        assert %{"message" => "User created!",
                "user" =>
                %{"address" => "Rua das bananeiras",
                  "age" => 21, "cep" => "12830300",
                  "cpf" => "32245742816",
                "email" => "edu.grangeiro2002@gmail.com",
                "id" => _id
                }} = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Eduardo"
      }

      response =
        conn
        |>post(Routes.users_path(conn, :create, params))
        |>json_response(:bad_request)

        expected_response = %{"message" => %{"address" => ["can't be blank"], "age" => ["can't be blank"], "cep" => ["can't be blank"], "cpf" => ["can't be blank"], "email" => ["can't be blank"]}}

        assert expected_response == response
    end

  end
end