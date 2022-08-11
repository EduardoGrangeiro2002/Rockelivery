defmodule Rockelivery.Users.Get do
  alias Rockelivery.User
  alias Rockelivery.Repo
  alias Rockelivery.Error

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
