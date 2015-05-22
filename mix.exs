defmodule ErlogSudokuSolver.Mixfile do
  use Mix.Project

  def project do
    [app: :erlog_sudoku_solver,
     version: "1.0.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :erlog]]
  end

  defp deps do
    [
        {:erlog, github: "rvirding/erlog", branch: "develop"}
    ]
  end
end
