defmodule NQueens do

  """
    moduledoc
    Solves the general N-Queens problem to find a safe position hotzontally, vertically, and diagonally.
    Assume the board square is the same size as the number of queens. IE 6 queens will be positioned on
    a 6x6 board.
  """
  def solve(1), do: [{0,0}] #{:ok, [["Q"]]}
  def solve(2), do: [] #{:invalid, []}
  def solve(3), do: [] #{:invalid, []}
  def solve(n) when n < 1, do: [] #{:invalid, []}
  def solve(n) do
    proposed = Enum.shuffle(0..n - 1) |> Enum.with_index
    valid_solution?(proposed, n)
  end

  def visualize(n) do
    solution = solve(n)
    display(solution, n)
  end
  def visualize(solution, n) do
    display(solution, n)
  end

  defp display(solution, n) do
    empty_list = List.duplicate("", n)
    Enum.map(solution, fn {val, _idx} ->
      List.update_at(empty_list, val, fn(_) ->
        "Q"
      end)
    end)
  end

  defp display(true, prop, _n), do: prop
  defp display(_, _prop, n), do: solve(n)

  defp valid_solution?(prop, n) do
    eval(prop, n)
    |> display(prop, n)
  end

  defp eval(_list, _n, acc \\ [])
  defp eval([], n, acc), do: eval_placements(acc)
  defp eval([el], n, acc), do: eval_placements(acc)
  defp eval([head|tail], n, acc) do
    acc = acc ++ Enum.map(tail, fn(row) ->
      valid_placement?(head, row)
    end)
    eval(tail, n, acc)
  end

  # [{2, 0}, {4, 1}, {0, 2}, {3, 3}, {1, 4}]
  defp valid_placement?({a_val, b_idx} = h, {_c_val, _d_idx} = tv) do
    if tv == {a_val + 1, b_idx + 1} || tv == {a_val - 1, b_idx + 1} do
      false
    else
      true
    end
  end

  defp eval_placements(acc) do
    Enum.find(acc, true, fn(x) ->
      x == false
    end)
  end
end
