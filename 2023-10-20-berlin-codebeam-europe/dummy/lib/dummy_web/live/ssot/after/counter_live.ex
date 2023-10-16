defmodule DummyWeb.After.CounterLive do
  use DummyWeb, :live_view

  alias DummyWeb.After.PlusOneComponent
  alias DummyWeb.After.PlusTwoComponent

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

  def handle_info({:update_count_plus_one, _count}, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_info({:update_count_plus_two, _count}, socket) do
    {:noreply, update(socket, :count, &(&1 + 2))}
  end
end
