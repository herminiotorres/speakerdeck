defmodule SurfaceDummy.Repo do
  use Ecto.Repo,
    otp_app: :surface_dummy,
    adapter: Ecto.Adapters.Postgres
end
