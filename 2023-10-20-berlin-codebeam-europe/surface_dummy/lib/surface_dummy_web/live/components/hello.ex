defmodule SurfaceDummyWeb.Components.Hello do
  use Surface.Component

  alias SurfaceDummyWeb.Components.Name

  prop name, :string, required: true
  prop surname, :string, required: true

  def render(assigns) do
    ~F"""
    <Name name={@name} surname={@surname} />
    """
  end
end
