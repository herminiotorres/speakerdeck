defmodule DummyWeb.Async.Example6Live do
  use DummyWeb, :live_view

  alias DummyWeb.Async.TableComponent
  alias Phoenix.LiveView.AsyncResult

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:connected?, connected?(socket))
      |> assign(:users, AsyncResult.loading())
      |> start_async(:load_users, fn -> load_users() end)

    {:ok, socket}
  end

  def handle_async(:load_users, {:ok, %{users: fetched_users}}, socket) do
    %{users: users} = socket.assigns

    {:noreply, assign(socket, :users, AsyncResult.ok(users, fetched_users))}
  end

  def handle_async(:load_users, {:exit, reason}, socket) do
    %{users: users} = socket.assigns

    {:noreply, assign(socket, :users, AsyncResult.failed(users, {:exit, reason}))}
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

  defp load_users do
    raise "BOOM!"

    []
  end
end
