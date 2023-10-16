defmodule DummyWeb.Before.ModalComponent do
  use DummyWeb, :live_component

  alias DummyWeb.SendUpdate.Modal

  def handle_event("close_modal", _unsigned_params, socket) do
    send_update(__MODULE__, id: "modal", show: "false")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div id={@id}>
      <Modal.markup show={@show} myself={@myself} />
    </div>
    """
  end
end
