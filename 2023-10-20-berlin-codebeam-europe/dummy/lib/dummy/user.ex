defmodule Dummy.User do
  @enforce_keys [:name, :email]
  defstruct [:uuid, :name, :email, :inserted_at, :updated_at]

  def new(name, email) do
    __MODULE__.__struct__(
      uuid: Faker.UUID.v4(),
      name: name,
      email: email,
      inserted_at: DateTime.utc_now(:microsecond),
      updated_at: DateTime.utc_now(:microsecond)
    )
  end
end
