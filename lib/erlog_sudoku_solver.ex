defmodule ErlogSudokuSolver do
  def solve(board) do
    createSolver(board)

    {:ok, start} = :erlog.new
    {:ok, solver} = :erlog.consult("./lib/sudoku.pl", start)

    case :erlog.prove({:solve, {:solution}}, solver) do
      {{:succeed, [ solution: solution ]}, _state} -> solution
      {:fail, _state} -> :no_solution
    end
  end

  defp createSolver(board) do
    File.rm("./lib/sudoku.pl")

    solver_content = EEx.eval_file("./lib/sudoku.pl.eex", [ board: translate_board(board) ])
    :ok = File.write("./lib/sudoku.pl", solver_content)
  end

  defp translate_board([ rowA, rowB, rowC, rowD ]) do
    "[ [ #{translate_row(rowA)} ], [ #{translate_row(rowB)} ], [ #{translate_row(rowC)} ], [ #{translate_row(rowD)} ] ]"
  end

  defp translate_row([ a, b, c, d ]) do
    " #{translate_cell(a)}, #{translate_cell(b)}, #{translate_cell(c)}, #{translate_cell(d)} "
  end

  defp translate_cell(:empty), do: "_"
  defp translate_cell(number) when is_integer(number), do: number
end
