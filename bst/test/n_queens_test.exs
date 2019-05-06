defmodule Util do
  def transpose(matrix) do
    List.zip(matrix) |> Enum.map(&Tuple.to_list/1)
    # List.zip(matrix) |> IO.inspect |> Enum.map(&Tuple.to_list/1)
  end
end

defmodule UtilTest do
  use ExUnit.Case
  test "transpose/1" do
    transposed = Util.transpose([[1,1],[2,2]])
    assert transposed == [[1,2],[1,2]]
    transposed = Util.transpose([[1,1,1],[2,2,2]])
    assert transposed == [[1,2],[1,2],[1,2]]
    transposed = Util.transpose([[1,1,1],[2,2,2],[3,3,3]])
    assert transposed == [[1,2,3],[1,2,3],[1,2,3]]
    transposed = Util.transpose([[1,1,1],[2,2,2],[3,3,3],[4,4,4]])
    assert transposed == [[1,2,3,4],[1,2,3,4],[1,2,3,4]]
  end
end

defmodule NQueensTest do
  use ExUnit.Case
  use ExUnitProperties
  # doctest NQueens

  test "n = 1" do
    assert NQueens.solve(1) == [{0,0}] #{:ok, [["Q"]]}
    assert NQueens.visualize(1) == [["Q"]]
  end

  test "n = 2" do
    assert NQueens.solve(2) == []
    assert NQueens.visualize(2) == []
  end

  test "n = 3" do
    assert NQueens.solve(3) == []
    assert NQueens.visualize(3) == []
  end

  test "n = 4" do
    assert NQueens.solve(4) == [{2, 0}, {0, 1}, {3, 2}, {1, 3}] || [{1, 0}, {3, 1}, {0, 2}, {2, 3}]
  end

  test "visualize/2 n = 4" do
    assert NQueens.visualize(4) == [
        ["", "", "Q", ""],
        ["Q", "", "", ""],
        ["", "", "", "Q"],
        ["", "Q", "", ""]
      ] || [
        ["", "Q", "", ""],
        ["", "", "", "Q"],
        ["Q", "", "", ""],
        ["", "", "Q", ""]
      ]
  end

  test "visualize/2 n = 5" do
    assert NQueens.solve(5)
    |> NQueens.visualize(5) == [
        ["", "Q", "", "", ""],
        ["", "", "", "Q", ""],
        ["Q", "", "", "", ""],
        ["", "", "Q", "", ""],
        ["", "", "", "", "Q"]
      ] || [
        ["", "", "", "Q", ""],
        ["Q", "", "", "", ""],
        ["", "", "Q", "", ""],
        ["", "", "", "", "Q"],
        ["", "Q", "", "", ""]
      ]
  end

  test "n = 5" do
    assert NQueens.solve(5) == [{2, 0}, {4, 1}, {0, 2}, {3, 3}, {1, 4}]
  end

  test "visualize/2 n = 6" do
    assert NQueens.solve(6)
    |> NQueens.visualize(6) == [["", "", "", "Q", "", ""], ["Q", "", "", "", "", ""], ["", "", "Q", "", "", ""], ["", "", "", "", "", "Q"], ["", "Q", "", "", "", ""], ["", "", "", "", "Q", ""]]
  end

  test "n = 6" do
    assert NQueens.solve(6) == [{5, 0}, {0, 1}, {2, 2}, {4, 3}, {1, 4}, {3, 5}]
  end

  describe "solve/1 properties" do
    property "solution length == n" do
      check all int <- positive_integer() do
        case int do
          1 ->
            solution = NQueens.solve(int)
            assert length(solution) == int
          2 ->
            solution = NQueens.solve(int)
            assert length(solution) == 0
          3 ->
            solution = NQueens.solve(int)
            assert length(solution) == 0
          _ ->
            solution = NQueens.solve(int)
            assert length(solution) == int
        end
        # IO.inspect int
      end
    end
  end

  describe "visualize/1 properties" do
    property "solution length == n, and each el length == n" do
      check all int <- positive_integer() do
        case int do
          1 ->
            solution = NQueens.visualize(int)
            assert length(solution) == 1
            row = List.first(solution)
            assert length(row) == 1
          2 ->
            solution = NQueens.visualize(int)
            assert length(solution) == 0
          3 ->
            solution = NQueens.visualize(int)
            assert length(solution) == 0
          _ ->
            solution = NQueens.visualize(int)
            assert length(solution) == int
            Enum.map(solution, &(assert length(&1) == int))
        end
      end
    end

    property "each row has n elements, one 'Q', and n-1 ''" do
      check all int <- integer(4..444) do
        solution = NQueens.visualize(int)
        assert length(solution) == int
        Enum.map(solution, fn(row) ->
          assert length(row) == int;
          assert Enum.count(row, &(&1 == "Q")) == 1;
          assert Enum.count(row, &(&1 == "")) == int - 1;
        end)
      end
    end

    property "each column has one 'Q' and n-1 ''" do
      check all int <- integer(4..444) do
        # IO.puts int

        solution = NQueens.visualize(int)
        # |> IO.inspect
        |> Util.transpose()
        # |> IO.inspect
        assert length(solution) == int
        Enum.map(solution, fn(row) ->
          assert length(row) == int;
          assert Enum.count(row, &(&1 == "Q")) == 1;
          assert Enum.count(row, &(&1 == "")) == int - 1;
        end)
      end
    end

    @tag :skip
    property "each diagonal zero or one 'Q'" do
      check all int <- integer(4..99) do
        solution = NQueens.visualize(int)
      end
    end

    # given square matrix of size n
    # output == [[{1,1},..{n,n}],[{2,1}..{n,n-1}]..[{n,n}]]
    def diagonals(n) do
      Enum.flat_map(0..n-1, fn(i) ->
        acc = diagonal_right({i,0}, n, [])
        |> IO.inspect
        acc2 = diagonal_left({n-1-i,0}, n, [])
        |> IO.inspect
        [acc, acc2]
        |> IO.inspect
        # IO.puts "VVV acc ++ acc2 VVV"
        # IO.inspect(acc ++ acc2)
      end)
    end

    def diagonal_right({x,y}, n, acc) when x == n - 1 do
      # IO.puts "diagonal_right({x,y}, n, acc) when x == n - 1 do"
      acc ++ [{x, y}]
    end
    def diagonal_right({x,y}, n, acc) when y == n - 1 do
      # IO.puts "diagonal_right({x,y}, n, acc) when y == n - 1 do"
      acc ++ [{x, y}]
    end
    def diagonal_right({x,y}, n, acc) do
      # IO.puts "diagonal_right({x,y}, n, acc) do"
      diagonal_right({x+1,y+1}, n, acc ++ [{x, y}])
    end

    def diagonal_left({x,y}, n, acc) when x == 0 do
      acc ++ [{x, y}]
    end
    def diagonal_left({x,y}, n, acc) when y == n - 1 do
      acc ++ [{x, y}]
    end
    def diagonal_left({x,y}, n, acc) do
      diagonal_left({x-1,y+1}, n, acc ++ [{x, y}])
    end

    test "diagonal_right" do
      IO.inspect diagonals(4)
      # assert diagonal_right({0,0}, 4, []) == []
    end
  end
end
