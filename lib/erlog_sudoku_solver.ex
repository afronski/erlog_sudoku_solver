defmodule ErlogSudokuSolver do
  def solve(_board) do
    {:ok, start} = :erlog.new
    {:ok, solver} = :erlog.consult("./lib/sudoku.pl", start)

    # *TODO*: How to invoke `L = [ [_,4,2,_], [_,2,1,_], [4,_,_,2], [2,_,_,1] ], sudoku(L).` and receive back filled `L`?
    case :erlog.prove({:append, [1], [2], { :solution }}, solver) do
      {{:succeed, [ solution: solution ]}, _state} -> solution
      :fail -> :no_solution
    end
  end
end
