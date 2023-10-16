defmodule SurfaceDummyWeb.Scoped.Toast do
  use Phoenix.Component

  attr :status, :string, default: "default"

  def message(assigns) do
    ~H"""
    <div class={[
      "my-4 px-6 py-4",
      @status == "default" && "bg-gray-200 border border-gray-600",
      @status == "success" && "bg-green-200 border border-green-600",
      @status == "info" && "bg-blue-200 border border-blue-600",
      @status == "warn" && "bg-yellow-200 border border-yellow-600",
      @status == "error" && "bg-red-200 border border-red-600"
    ]}>
      <h2 class={[
        "font-semibold text-2xl",
        @status == "default" && "text-gray-600",
        @status == "success" && "text-green-600",
        @status == "info" && "text-blue-600",
        @status == "warn" && "text-yellow-600",
        @status == "error" && "text-red-600"
      ]}>
        That show's called a pilot.
      </h2>
      <p class={[
        "font-light text-sm italic",
        @status == "default" && "text-gray-800",
        @status == "success" && "text-green-800",
        @status == "info" && "text-blue-800",
        @status == "warn" && "text-yellow-800",
        @status == "error" && "text-red-800"
      ]}>
        Well, the way they make shows is, they make one show.
      </p>
    </div>
    """
  end
end
