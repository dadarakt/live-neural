defmodule AnimationWeb.AnimationLive do
  use AnimationWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 16)
    {:ok, assign(socket, :i, 0)}
  end

  def handle_info(:update, %{assigns: %{i: i}} = socket) do
    Process.send_after(self(), :update, 16)
    {:noreply, assign(socket, :i, i + 0.05)}
  end

  def render(assigns) do
    ~L"""
    <canvas data-i="<%= @i %>"
            phx-hook="canvas"
            phx-update="ignore">
      Canvas is not supported!
    </canvas>
    """
  end
end
