defmodule SurfaceDummyWeb.Components.Surname do
  use Surface.Component

  alias SurfaceDummyWeb.Components.DateTime

  # public prop
  prop(surname, :string, required: true)

  def render(assigns) do
    ~F"""
    {@surname}

    <DateTime />
    """
  end
end
