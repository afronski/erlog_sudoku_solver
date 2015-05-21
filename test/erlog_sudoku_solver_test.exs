defmodule ErlogSudokuSolverTest do
  use ExUnit.Case

  test "solver should provide an answer for given board" do
    board = [ [nil,4,2,nil], [nil,2,1,nil], [4,nil,nil,2], [2,nil,nil,1] ]
    assert ErlogSudokuSolver.solve(board) == [[1, 2, 3, 4], [3, 4, 1, 2], [2, 1, 4, 3], [4, 3, 2, 1]]
  end
end
