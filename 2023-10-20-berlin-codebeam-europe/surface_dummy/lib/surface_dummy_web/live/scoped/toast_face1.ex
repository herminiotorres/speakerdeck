defmodule SurfaceDummyWeb.Scoped.ToastFace1 do
  use Surface.Component

  prop(status, :string, default: "default")

  def render(assigns) do
    ~F"""
    <div class={[
      "my-4 px-6 py-4",
      "bg-gray-200 border border-gray-600": @status == "default",
      "bg-green-200 border border-green-600": @status == "success",
      "bg-blue-200 border border-blue-600": @status == "info",
      "bg-yellow-200 border border-yellow-600": @status == "warn",
      "bg-red-200 border border-red-600": @status == "error"
    ]}>
      <h2 class={[
        "font-semibold text-2xl",
        "text-gray-600": @status == "default",
        "text-green-600": @status == "success",
        "text-blue-600": @status == "info",
        "text-yellow-600": @status == "warn",
        "text-red-600": @status == "error"
      ]}>
        That show's called a pilot.
      </h2>
      <p class={[
        "font-light text-sm italic",
        "text-gray-800": @status == "default",
        "text-green-800": @status == "success",
        "text-blue-800": @status == "info",
        "text-yellow-800": @status == "warn",
        "text-red-800": @status == "error"
      ]}>
        Well, the way they make shows is, they make one show.
      </p>
    </div>
    """
  end
end
