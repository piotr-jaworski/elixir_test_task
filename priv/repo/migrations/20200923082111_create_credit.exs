defmodule Credit.Repo.Migrations.CreateCredit do
  use Ecto.Migration

  def change do
    create table(:credit) do
      add :total_cost, :float
      add :installment, :float
      add :amount, :float
      add :avg_income, :float
      add :interest, :float
      add :period, :integer
      add :avg_expenses, :float

      timestamps()
    end

  end
end
