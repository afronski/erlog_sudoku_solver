defmodule ErlogSudokuSolver do
  def solve(_board) do
    {:ok, start} = :erlog.new
    {:ok, solver} = :erlog.consult("./lib/sudoku.pl", start)

    case :erlog.prove({:append, [1], [2], { :solution }}, solver) do
      {{:succeed, [ solution: solution ]}, _state} -> solution
      :fail -> :no_solution
    end
  end
end
