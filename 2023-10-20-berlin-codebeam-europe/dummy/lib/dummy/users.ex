defmodule Dummy.Users do
  alias Dummy.User

  def all(num \\ 10) do
    Process.sleep(:timer.seconds(2))

    1..num
    |> Task.async_stream(fn _ -> {Faker.Person.PtBr.name(), Faker.Internet.email()} end)
    |> Enum.map(fn {_, {name, email}} ->
      User.new(name, email)
    end)
  end
end
