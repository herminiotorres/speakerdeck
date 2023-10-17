defmodule SurfaceDummyWeb.Scoped.ToastFace3 do
  use Surface.Component

  prop status, :string, default: "default"

  def render(assigns) do
    ~F"""
    <div data-status={@status} class="toast">
      <h2 class="title">
        That show's called a pilot.
      </h2>
      <p class="subtitle">
        Well, the way they make shows is, they make one show.
      </p>
    </div>
    """
  end
end
