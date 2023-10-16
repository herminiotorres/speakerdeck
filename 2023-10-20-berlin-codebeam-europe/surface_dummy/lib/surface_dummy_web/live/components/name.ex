defmodule SurfaceDummyWeb.Components.Name do
  use Surface.Component

  alias SurfaceDummyWeb.Components.Surname

  @doc "Someone to say hello to"
  prop(name, :string, required: true)
  prop(surname, :string, required: true)

  def render(assigns) do
    ~F"""
    Hello, {@name} <Surname surname={@surname} />
    """
  end
end
