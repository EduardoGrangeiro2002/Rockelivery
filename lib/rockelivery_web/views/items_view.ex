defmodule RockeliveryWeb.ItemsView do
  use RockeliveryWeb, :view

  alias Rockelivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created!",
      item: item
    }
  end

  def render("show.json", %{item: %Item{} = item}), do: %{item: item}

  def render("update.json", %{item: %Item{} = item}) do
    %{
      message: "Item update!",
      item: item
    }
  end
end
