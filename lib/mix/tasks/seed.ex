defmodule Mix.Tasks.Seed do
  @moduledoc "The seed mix task: `mix help seed`"
  use Mix.Task

  @shortdoc "Runs the seed script"
  def run(_) do
    Mix.Task.run("app.start")
    Code.eval_file("priv/repo/seeds.exs")
  end
end
