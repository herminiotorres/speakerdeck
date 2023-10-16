defmodule DummyWeb.Async.Example4Live do
  use DummyWeb, :live_view

  alias Dummy.Users
  alias DummyWeb.Async.TableStreamComponent

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:connected?, connected?(socket))
      |> stream_configure(:users, dom_id: &"users-#{&1.uuid}")
      |> stream(:users, load_users({:socket_connected?, connected?(socket)}))

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <TableStreamComponent.connected connected?={@connected?} />
    <TableStreamComponent.table streams={@streams} />
    """
  end

  def handle_info(:insert_user, socket) do
    [user] = Users.all(1)

    socket =
      stream_insert(socket, :users, user, at: -1)

    {:noreply, socket}
  end

  def handle_info(:load_users, socket) do
    socket =
      Users.all(3)
      |> Enum.reduce(socket, fn user, socket ->
        stream_insert(socket, :users, user, at: -1)
      end)

    {:noreply, socket}
  end

  defp load_users({:socket_connected?, true}) do
    lv_pid = self()
    Process.send_after(lv_pid, :load_users, :timer.seconds(1))

    Task.async_stream(
      1..3,
      fn _ -> Process.send_after(lv_pid, :insert_user, :timer.seconds(1)) end
    )
    |> Enum.to_list()

    []
  end

  defp load_users({:socket_connected?, _}), do: []
end
