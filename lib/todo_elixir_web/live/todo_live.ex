defmodule TodoElixirWeb.TodoLive do
  use TodoElixirWeb, :live_view
  alias TodoElixir.Tasks

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:tasks, Tasks.list_tasks())
      |> assign(:form, to_form(%{"title" => ""}))

    {:ok, socket}
  end

  def handle_event("add", %{"title" => title}, socket) do
    title = String.trim(title)

    if title == "" do
      {:noreply, socket}
    else
      {:ok, _task} = Tasks.create_task(%{"title" => title})
      {:noreply, assign(socket, tasks: Tasks.list_tasks(), form: to_form(%{"title" => ""}))}
    end
  end

  def render(assigns) do
    ~H"""
    <main style="max-width: 600px; margin: 40px auto; font-family: sans-serif;">
      <h1>Todo List</h1>

      <.form for={@form} phx-submit="add">
        <input type="text" name="title" placeholder="Nova tarefa..." />
        <button type="submit">Adicionar</button>
      </.form>

      <ul>
        <%= for task <- @tasks do %>
          <li><%= task.title %></li>
        <% end %>
      </ul>
    </main>
    """
  end
end
