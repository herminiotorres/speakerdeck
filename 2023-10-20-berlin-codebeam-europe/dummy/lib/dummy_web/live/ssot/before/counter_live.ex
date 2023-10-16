defmodule DummyWeb.Before.CounterLive do
  use DummyWeb, :live_view

  alias DummyWeb.Before.PlusOneComponent
  alias DummyWeb.Before.PlusTwoComponent

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(count: 0)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>LiveView count: <%= @count %></h1>

    <.live_component module={PlusOneComponent} id="PlusOneComponent" count={@count} />
    <.live_component module={PlusTwoComponent} id="PlusTwoComponent" count={@count} />
    """
  end

  def handle_info({:update_count, count}, socket) do
    {:noreply, assign(socket, :count, count)}
  end
end
