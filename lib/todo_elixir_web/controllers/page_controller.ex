defmodule TodoElixirWeb.PageController do
  use TodoElixirWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
