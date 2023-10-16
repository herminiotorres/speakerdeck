defmodule SurfaceDummyWeb.Context.ContextLive do
  use Surface.LiveView

  alias SurfaceDummyWeb.Components.Hello

  def mount(_, _, socket) do
    socket = Context.put(socket, timezone: "Etc/UTC")
    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <main class="px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-2xl">
        <div class="text-xl font-semibold">
          <Hello name="John" surname="Doe"/>
        </div>

        <form :on-change="change_timezone" class="mt-20">
          <select  id="timezone" name="timezone" class="mt-2 block w-full rounded-md border border-gray-300 bg-white shadow-sm focus:border-zinc-400 focus:ring-0 sm:text-sm">
            <option value="" selected="">Select</option>
            <option value="berlin">Berlin</option><option value="fortaleza">Fortaleza</option><option value="new_york">New York</option>
          </select>
        </form>
      </div>
    </main>
    """
  end

  def handle_event("change_timezone", %{"timezone" => timezone}, socket) do
    timezone =
      case timezone do
        "berlin" -> "Europe/Berlin"
        "new_york" -> "America/New_York"
        "fortaleza" -> "America/Fortaleza"
        _ -> "Etc/UTC"
      end

    socket = Context.put(socket, timezone: timezone)

    {:noreply, socket}
  end
end
