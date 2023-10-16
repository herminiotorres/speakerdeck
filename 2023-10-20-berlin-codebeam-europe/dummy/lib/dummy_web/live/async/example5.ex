defmodule DummyWeb.Async.Example5Live do
  use DummyWeb, :live_view

  alias Dummy.Users
  alias DummyWeb.Async.TableComponent

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:connected?, connected?(socket))
      |> assign_async(:users, fn -> load_users() end)

    {:ok, socket}
  end

  defp load_users do
    Process.sleep(:timer.seconds(2))
    {:ok, %{users: Users.all(10)}}
  end

  def render(assigns) do
    ~H"""
    <TableComponent.connected connected?={@connected?} />

    <.async_result :let={users} assign={@users}>
      <:loading>
        <span class="animate-pulse">
          Loading users...
        </span>
      </:loading>
      <:failed :let={_reason}>Failed to load users</:failed>

      <TableComponent.table users={users} />
    </.async_result>

    <pre><code><%= @users |> inspect(limit: :infinity) |> Code.format_string!() %></code></pre>
    """
  end
end
