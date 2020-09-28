defmodule CreditWeb.FallbackController do

  use CreditWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(CreditWeb.ErrorView)
    |> render("404.json", status: :not_found)
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
      conn
      |> put_status(:unprocessable_entity)
      |> put_view(CreditWeb.ErrorView)
      |> render("422.json", changeset: changeset)
  end
end
