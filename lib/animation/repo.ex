defmodule Animation.Repo do
  use Ecto.Repo,
    otp_app: :animation,
    adapter: Ecto.Adapters.Postgres
end
