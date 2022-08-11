defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  alias RockeliveryWeb.ErrorView
  alias Rockelivery.Error
  alias Ecto.Changeset

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end

  def call(conn, {:error, %Changeset{} = changeset}) do
    IO.inspect(changeset)
    conn
    |> put_view(ErrorView)
    |> render("error.json", message: changeset)
  end
end
