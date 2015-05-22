defmodule ErlogSudokuSolverTest do
  use ExUnit.Case

  test "solver should provide one answer for a given board" do
    board = [
      [:empty, 4, 2, :empty],
      [:empty, 2, 1, :empty],
      [4, :empty, :empty, 2],
      [2, :empty, :empty, 1]
    ]

    expected = [
      [1, 4, 2, 3],
      [3, 2, 1, 4],
      [4, 1, 3, 2],
      [2, 3, 4, 1]
    ]

    assert ErlogSudokuSolver.solve(board) == expected
  end

  test "solver should provide no answer for a given board" do
    board = [
      [:empty, 4, 2, :empty],
      [:empty, 4, 1, :empty],
      [4, :empty, :empty, 2],
      [2, :empty, :empty, 1]
    ]

    assert ErlogSudokuSolver.solve(board) == :no_solution
  end

  test "solver should provide any answer for empty board" do
    board = [
      [:empty, :empty, :empty, :empty],
      [:empty, :empty, :empty, :empty],
      [:empty, :empty, :empty, :empty],
      [:empty, :empty, :empty, :empty]
    ]

    refute ErlogSudokuSolver.solve(board) == :no_solution
  end

  test "solver should provide one answer for already solved board" do
    expected = [
      [1, 4, 2, 3],
      [3, 2, 1, 4],
      [4, 1, 3, 2],
      [2, 3, 4, 1]
    ]

    assert ErlogSudokuSolver.solve(expected) == expected
  end
end
