defmodule CreditWeb.CreditView do
  use CreditWeb, :view

  def render("index.json", %{credits: credits}) do
    %{credits: render_many(credits, CreditWeb.CreditView, "credit.json")}
  end

  def render("show.json", %{credit: credit}) do
    %{credit: render_one(credit, CreditWeb.CreditView, "credit.json")}
  end

  def render("credit.json", %{credit: credit}) do
    %{
      id: credit.id,
      total_cost: credit.total_cost,
      installment: credit.installment,
      amount: credit.amount,
      period: credit.period,
      interest: credit.interest,
      avg_expenses: credit.avg_expenses,
      avg_income: credit.avg_income
    }
  end
end
