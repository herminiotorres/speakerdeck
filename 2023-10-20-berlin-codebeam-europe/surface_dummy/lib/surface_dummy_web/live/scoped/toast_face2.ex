defmodule SurfaceDummyWeb.Scoped.ToastFace2 do
  use Surface.Component

  prop status, :string, default: "default"

  def render(assigns) do
    ~F"""
    <style>
    .toast {
      @apply my-4 px-6 py-4 bg-gray-200 border border-gray-600;
    }

    .title {
      @apply font-semibold text-2xl text-gray-600;
    }

    .subtitle {
      @apply font-light text-sm italic text-gray-800;
    }

    .toast[data-status='success'] {
      @apply bg-green-200 border border-green-600;

      .title {
        @apply text-green-600;
      }

      .subtitle {
        @apply text-green-800;
      }
    }

    .toast[data-status='info'] {
      @apply bg-blue-200 border border-blue-600;

      .title {
        @apply text-blue-600;
      }

      .subtitle {
        @apply text-blue-800;
      }
    }

    .toast[data-status='warn'] {
      @apply bg-yellow-200 border border-yellow-600;

      .title {
        @apply text-yellow-600;
      }

      .subtitle {
        @apply text-yellow-800;
      }
    }

    .toast[data-status='error'] {
      @apply bg-red-200 border border-red-600;

      .title {
        @apply text-red-600;
      }

      .subtitle {
        @apply text-red-800;
      }
    }

    </style>

    <div data-status={@status} class="toast">
      <h2 class="title">
        That show's called a pilot.
      </h2>
      <p class="subtitle">
        Well, the way they make shows is, they make one show.
      </p>
    </div>
    """
  end
end
