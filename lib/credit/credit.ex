defmodule Credit.Credit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit" do
    field :amount, :float
    field :avg_expenses, :float
    field :avg_income, :float
    field :installment, :float
    field :interest, :float
    field :period, :integer
    field :total_cost, :float

    timestamps()
  end

  @doc false
  def changeset(credit, attrs) do
    credit
    |> cast(attrs, [:total_cost, :installment, :amount, :avg_income, :interest, :period, :avg_expenses])
    |> validate_required([:total_cost, :installment, :amount, :avg_income, :interest, :period, :avg_expenses])
  end
end
