defmodule SurfaceDummyWeb.Components.DateTime do
  use Surface.Component

  # private prop
  data timezone, :string, from_context: :timezone

  @dt ~U[2023-10-20 14:30:00.000000Z]

  def render(assigns) do
    ~F"""
    {local_datetime(@timezone)} - Timezone: {@timezone}
    """
  end

  defp local_datetime(timezone) do
    @dt
    |> DateTime.shift_zone!(timezone)
    |> Calendar.strftime("%d/%m/%Y %H:%M")
  end
end
