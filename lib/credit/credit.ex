defmodule Credit.Credit do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Credit.Repo
  alias Credit.Credit

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


  def changeset(credit, attrs) do
    credit
    |> cast(attrs, [:amount, :avg_income, :interest, :period, :avg_expenses])
    |> validate_required([:amount, :avg_income, :interest, :period, :avg_expenses])
    |> validate_number(:amount, greater_than: 0)
    |> validate_number(:avg_income, greater_than: 0)
    |> validate_number(:interest, greater_than: 0)
    |> validate_number(:period, greater_than: 0)
    |> validate_number(:avg_expenses, greater_than_or_equal_to: 0)
    |> put_installment_and_total_cost()
    |> validate_required([:installment, :total_cost])
  end

  def list_credits do
    Repo.all(Credit)
  end

  def get_credit(id) do
    Repo.get!(Credit, id)
  end

  def create_credit(attrs \\ %{}) do
    %Credit{}
    |> Credit.changeset(attrs)
    |> Repo.insert()
  end

  defp put_installment_and_total_cost(
    %Ecto.Changeset{valid?: true, changes: %{amount: amount, interest: interest, period: period, avg_income: avg_income, avg_expenses: avg_expenses}} = changeset
    ) do
        # mathematical formula from https://pl.wikipedia.org/wiki/Raty_r%C3%B3wne
        installment = (amount*interest)/(12*(1-:math.pow(12/(12+interest),period)))

        total_cost = installment*period - amount
        if installment > avg_income - avg_expenses do
          add_error(changeset, :installment, "can't afford that credit")
        else
          change(changeset, %{installment: installment, total_cost: total_cost})
        end
  end

  defp put_installment_and_total_cost(
    %Ecto.Changeset{valid?: false} = changeset
    ) do
        add_error(changeset, :installment, "not enaugh data")
  end
end
