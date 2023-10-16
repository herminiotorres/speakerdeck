defmodule DummyWeb.Async.Example3Live do
  use DummyWeb, :live_view

  alias Dummy.Users
  alias DummyWeb.Async.TableComponent

  def mount(_params, _session, socket) do
    socket =
      if connected?(socket) do
        socket
        |> assign(:connected?, connected?(socket))
        |> assign(:users, load_users())
      else
        socket
        |> assign(:connected?, connected?(socket))
        |> assign(:users, "Loading users...")
      end

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <TableComponent.connected connected?={@connected?} />
    <TableComponent.table users={@users} />
    """
  end

  defp load_users do
    Process.sleep(:timer.seconds(9))
    Users.all(10)
  end
end
