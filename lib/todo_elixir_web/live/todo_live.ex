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

  def handle_event("delete", %{"id" => id}, socket) do
    id = String.to_integer(id)
    task = Tasks.get_task!(id)
    {:ok, _} = Tasks.delete_task(task)

    {:noreply, assign(socket, tasks: Tasks.list_tasks())}
  end

  def handle_event("toggle_complete", %{"id" => id}, socket) do
    id = String.to_integer(id)
    task = Tasks.get_task!(id)
    {:ok, _} = Tasks.toggle_complete(task)

    {:noreply, assign(socket, tasks: Tasks.list_tasks())}
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
          <li style="display:flex; gap:10px; align-items:center; margin-top:8px;">
            <span style={if task.done, do: "text-decoration: line-through; opacity: 0.7;", else: ""}>
              <%= task.title %>
            </span>

            <button
              type="button"
              phx-click="toggle_complete"
              phx-value-id={task.id}
            >
              <%= if task.done, do: "Desmarcar", else: "Concluir" %>
            </button>

            <button
              type="button"
              phx-click="delete"
              phx-value-id={task.id}
            >
              Excluir
            </button>
          </li>
        <% end %>
      </ul>
    </main>
    """
  end
end
