defmodule BST do

  def insert(nil, value) do
    IO.puts "insert/2 NIL: #{value}"
    insert(tree(), value)
  end

   def insert(%{value: v0} = tree, value) when value > v0 do
    IO.puts "RIGHT #{value}"
    IO.inspect v0
    insert(Map.put(tree, :right, value), value)
  end
  def insert(%{value: v0} = tree, value) when value < v0 do
    IO.puts "LEFT #{value}"
    IO.inspect v0
    insert(Map.get(tree, :left), value)
  end
  def insert(tree, value) do
    IO.puts "insert/2"
    # v0 = Map.get(tree, :value)
    # case do
    #   v0 < value -> insert(Map.get(tree, :left), value)
    #   v0 > value -> insert(Map.get(tree, :right), value)
    #   _ ->
    # end
    Map.put(tree, :value, value)
  end

  def tree() do
    %{value: nil, left: nil, right: nil}
  end
end


ExUnit.start

defmodule BSTTest do
  use ExUnit.Case
  use ExUnitProperties

    # test "first" do
  #   assert BST.insert(nil, 2) == %{value: 2, left: nil, right: nil}
  # end

  # test "second" do
  #   tree = BST.insert(BST.tree, 2)
  #   assert BST.insert(tree, 3) == %{value: 2, left: nil, right: %{value: 3, left: nil, right: nil}}
  # end

  describe "Properties" do
    property "sum of positive integer is greater than both integers" do
      check all list <- list_of(term()),
                list != [],
                elem <- member_of(list) do
        assert elem in list
      end
    end

  end
end