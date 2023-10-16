defmodule DummyWeb.Before.DemoLive do
  use DummyWeb, :live_view

  alias DummyWeb.Before.ModalComponent
  alias DummyWeb.SendUpdate.Modal

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("open_modal", _unsigned_params, socket) do
    send_update(ModalComponent, id: "modal", show: true)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <Modal.btn_open />

    <.live_component module={ModalComponent} id="modal" show={false} />
    """
  end
end
