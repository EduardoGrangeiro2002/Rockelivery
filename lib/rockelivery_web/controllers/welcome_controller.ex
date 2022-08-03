defmodule RockeliveryWeb.WelcomeController do
  use RockeliveryWeb, :controller

  def index(conn, params) do
    conn
    |> IO.inspect()
    |> put_status(:ok)
    |> text("Welcome :)")
  end
end
