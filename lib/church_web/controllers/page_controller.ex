defmodule ChurchWeb.PageController do
  use ChurchWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
