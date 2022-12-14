defmodule Rockelivery.Users.Create do

  alias Rockelivery.User
  alias Rockelivery.Repo
  alias Rockelivery.Error

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
