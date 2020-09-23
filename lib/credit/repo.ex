defmodule Credit.Repo do
  use Ecto.Repo,
    otp_app: :credit,
    adapter: Ecto.Adapters.Postgres
end
