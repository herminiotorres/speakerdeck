defmodule DummyWeb.After.PlusTwoComponent do
  use DummyWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id={@id} class="px-4 py-2 border-2 border-green-300">
      <p>liveComponent sum +2: <%= @count %></p>

      <button
        phx-click="increment"
        phx-target={@myself}
        type="button"
        class="px-4 py-2 bg-blue-600 rounded-md text-white outline-none focus:ring-4 shadow-lg transform active:scale-75 transition-transform"
      >
        increment
      </button>
    </div>
    """
  end

  def handle_event("increment", _, socket) do
    %{count: count} = socket.assigns

    send(self(), {:update_count_plus_two, count})

    {:noreply, socket}
  end
end
