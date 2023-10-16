defmodule DummyWeb.After.ModalComponent do
  use DummyWeb, :live_component

  alias DummyWeb.SendUpdate.Modal

  # Public API
  def open_modal(modal_id) do
    send_update(__MODULE__, id: modal_id, show: true)
  end

  def close_modal(modal_id) do
    send_update(__MODULE__, id: modal_id, show: false)
  end

  def handle_event("close_modal", _unsigned_params, socket) do
    close_modal("modal")

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
