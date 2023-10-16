defmodule SurfaceDummyWeb.Scoped.Example1Live do
  use SurfaceDummyWeb, :live_view

  alias SurfaceDummyWeb.Scoped.Toast

  def mount(_, _, socket) do
    {:ok, assign(socket, status: "default")}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-4xl">Toast message affected by the status.</h1>
    <div>
      <Toast.message status={@status} />
    </div>

    <.simple_form :let={form} for={to_form(%{"status" => nil})} phx-change="validate">
      <.input
        field={form["status"]}
        type="select"
        prompt="select"
        options={~w(success info warn error)}
      />
    </.simple_form>
    """
  end

  def handle_event("validate", %{"status" => status}, socket) do
    status =
      case status do
        "" -> "default"
        status -> status
      end

    {:noreply, assign(socket, :status, status)}
  end
end
