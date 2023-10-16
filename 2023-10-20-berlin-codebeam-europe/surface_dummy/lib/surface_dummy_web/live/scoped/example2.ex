defmodule SurfaceDummyWeb.Scoped.Example2Live do
  use Surface.LiveView

  alias SurfaceDummyWeb.Scoped.ToastFace1
  alias SurfaceDummyWeb.Scoped.ToastFace2
  alias SurfaceDummyWeb.Scoped.ToastFace3

  def mount(_, _, socket) do
    {:ok, assign(socket, status: "default")}
  end

  def render(assigns) do
    ~F"""
    <main class="px-4 py-20 sm:px-6 lg:px-8">
      <h1 class="text-4xl text-center">Toast message affected by the status.</h1>
      <div class="mx-auto max-w-2xl">
        <ToastFace1 status={@status} />
        <ToastFace2 status={@status} />
        <ToastFace3 status={@status} />


        <form :on-change="validate">
        <select  id="status" name="status" class="mt-2 block w-full rounded-md border border-gray-300 bg-white shadow-sm focus:border-zinc-400 focus:ring-0 sm:text-sm">
            <option value="" selected="">Select</option>
            <option value="success">success</option><option value="info">info</option><option value="warn">warn</option><option value="error">error</option>
          </select>
        </form>
      </div>
    </main>
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
