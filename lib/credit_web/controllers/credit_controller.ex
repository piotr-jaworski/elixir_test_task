defmodule CreditWeb.CreditController do
  use CreditWeb, :controller

  alias Credit.Credit

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do

    credits = Credit.list_credits()
    render(conn, "index.json", credits: credits)
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do

    credit = Credit.get_credit(id)
    render(conn, "show.json", credit: credit)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"credit" => credit_params}) do
    with {:ok, %Credit{} = credit} <- Credit.create_credit(credit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.credit_path(conn, :show, credit))
      |> render("show.json", credit: credit)
    end
  end
end
