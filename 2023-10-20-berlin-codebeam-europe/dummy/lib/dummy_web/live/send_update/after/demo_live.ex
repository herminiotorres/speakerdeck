defmodule DummyWeb.After.DemoLive do
  use DummyWeb, :live_view

  alias DummyWeb.After.ModalComponent
  alias DummyWeb.SendUpdate.Modal

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("open_modal", _unsigned_params, socket) do
    ModalComponent.open_modal("modal")

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <Modal.btn_open />

    <.live_component module={ModalComponent} id="modal" show={false} />
    """
  end
end
