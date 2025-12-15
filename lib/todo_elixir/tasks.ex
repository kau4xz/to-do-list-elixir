defmodule TodoElixir.Tasks do
  import Ecto.Query, warn: false

  alias TodoElixir.Repo
  alias TodoElixir.Tasks.Task

  def list_tasks do
    Repo.all(from t in Task, order_by: [desc: t.inserted_at])
  end

  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def get_task!(id), do: Repo.get!(Task, id)

  def delete_task(%Task{} = task), do: Repo.delete(task)

  def toggle_complete(%Task{} = task) do
    task
    |> Task.changeset(%{done: !task.done})
    |> Repo.update()
  end
end
