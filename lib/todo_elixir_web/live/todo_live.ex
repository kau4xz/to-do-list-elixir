defmodule TodoElixirWeb.TodoLive do
  use TodoElixirWeb, :live_view
  alias TodoElixir.Tasks

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:tasks, Tasks.list_tasks())
     |> assign(:form, to_form(%{"title" => ""}))}
  end

  def handle_event("add", %{"title" => title}, socket) do
    title = String.trim(title)

    if title == "" do
      {:noreply, socket}
    else
      {:ok, _} = Tasks.create_task(%{"title" => title})
      {:noreply, assign(socket, tasks: Tasks.list_tasks(), form: to_form(%{"title" => ""}))}
    end
  end

  def handle_event("delete", %{"id" => id}, socket) do
    task = Tasks.get_task!(String.to_integer(id))
    {:ok, _} = Tasks.delete_task(task)
    {:noreply, assign(socket, tasks: Tasks.list_tasks())}
  end

  def handle_event("toggle_complete", %{"id" => id}, socket) do
    task = Tasks.get_task!(String.to_integer(id))
    {:ok, _} = Tasks.toggle_complete(task)
    {:noreply, assign(socket, tasks: Tasks.list_tasks())}
  end

  def render(assigns) do
    ~H"""
    <main class="min-h-screen bg-base-200">
      <div class="container mx-auto max-w-2xl p-6">
        <div class="card bg-base-100 shadow-xl">
          <div class="card-body">
            <h1 class="card-title text-2xl">Todo List</h1>

            <.form for={@form} phx-submit="add" class="flex gap-2">
              <input
                type="text"
                name="title"
                placeholder="Nova tarefa..."
                class="input input-bordered w-full"
              />
              <button type="submit" class="btn btn-primary">Adicionar</button>
            </.form>

            <div class="divider"></div>

            <ul class="space-y-2">
              <%= for task <- @tasks do %>
                <li class="flex items-center justify-between gap-3 p-3 rounded-lg bg-base-200">
                  <div class="flex items-center gap-2">
                    <input
                      type="checkbox"
                      class="checkbox"
                      checked={task.done}
                      phx-click="toggle_complete"
                      phx-value-id={task.id}
                    />
                    <span class={if task.done, do: "line-through opacity-60", else: ""}>
                      <%= task.title %>
                    </span>
                  </div>

                  <button class="btn btn-sm btn-error" phx-click="delete" phx-value-id={task.id}>
                    Excluir
                  </button>
                </li>
              <% end %>
            </ul>

            <%= if Enum.empty?(@tasks) do %>
              <p class="opacity-60">Nenhuma tarefa ainda. Adicione a primeira 👆</p>
            <% end %>
          </div>
        </div>
      </div>
    </main>
    """
  end
end
