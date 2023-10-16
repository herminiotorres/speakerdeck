defmodule DummyWeb.Async.Example1Live do
  use DummyWeb, :live_view

  alias Dummy.Users
  alias DummyWeb.Async.TableComponent

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:connected?, connected?(socket))
      |> assign(:users, load_users())

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <TableComponent.connected connected?={@connected?} />
    <TableComponent.table users={@users} />
    """
  end

  defp load_users do
    Process.sleep(:timer.seconds(2))
    Users.all(10)
  end
end
