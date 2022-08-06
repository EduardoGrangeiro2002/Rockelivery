defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller
  alias Rockelivery.Create

  def create(conn, params) do
    Rockelivery.create_user(params)
  end
end
