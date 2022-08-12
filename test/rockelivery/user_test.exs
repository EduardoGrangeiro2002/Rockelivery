defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Rockelivery.User
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 21,
        address: "Rua das bananeiras",
        cpf: "32245742816",
        cep: "12830300",
        email: "edu.grangeiro2002@gmail.com",
        password: "123456",
        name: "Eduardo"
      }

      response  = User.changeset(params)

      assert %Changeset{changes: %{name: "Eduardo"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        age: 17,
        address: "Rua das bananeiras",
        cpf: "32245742816",
        cep: "12830300",
        email: "edu.grangeiro2002@gmail.com",
        password: "123",
        name: "Eduardo"
      }


      response =
        params
        |> User.changeset()

        expected_response = %{age: ["must be greater than or equal to 18"], password: ["should be at least 6 character(s)"]}

      assert errors_on(response) == expected_response
    end

  end

  describe "changeset/2" do
    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        age: 21,
        address: "Rua das bananeiras",
        cpf: "32245742816",
        cep: "12830300",
        email: "edu.grangeiro2002@gmail.com",
        password: "123456",
        name: "Eduardo"
      }

      update_params = %{name: "Banana", email: "banana@gmail.com"}
      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)


      assert %Changeset{changes: %{name: "Banana"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        age: 21,
        address: "Rua das bananeiras",
        cpf: "32245742816",
        cep: "12830300",
        email: "edu.grangeiro2002@gmail.com",
        password: "123456",
        name: "Eduardo"
      }

      update_params = %{name: "Banana", email: "banana@gmail.com", age: 17}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

        expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(response) == expected_response
    end
  end
end
