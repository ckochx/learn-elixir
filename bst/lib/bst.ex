defmodule Bst do
  @moduledoc """
  Documentation for Bst.
  """

  def insert(%{value: value, left: left, right: right} = bstree, node_value) do
    if node_value < value do
      %{value: value, left: insert(left, node_value), right: right}
    else
      %{value: value, left: left, right: insert(right, node_value)}
    end
  end
  def insert(_leaf, node_value), do: tree(node_value)
  def tree() do
    %{value: nil, left: nil, right: nil}
  end
  def tree(value) do
    %{value: value, left: nil, right: nil}
  end

  def left_traversal(tree) do
    IO.inspect tree
    acc = left_traversal(tree[:left], [])
    IO.inspect acc
    # left_traversal(tree[:right], acc)
  end
  def left_traversal(nil, acc), do: acc
  def left_traversal(%{value: value, left: left, right: _right} = tree, acc) do
    IO.puts "left_traversal"
    IO.inspect acc
    IO.inspect tree
    IO.inspect value
    left_traversal(left, acc ++ [value])
    # acc ++ [value]
  end
  # def left_traversal(%{value: value, left: nil, right: nil} = tree, acc) do
  #   IO.puts "left_traversal right is also nil"
  #   IO.inspect acc
  #   IO.inspect value
  #   left_traversal(nil, acc ++ [value])
  # end
  # def left_traversal(%{value: value, left: nil, right: _right} = tree, acc) do
  #   IO.puts "left_traversal left is nil"
  #   IO.inspect acc
  #   IO.inspect value
  #   # left_traversal(tree, acc ++ [value])
  #   acc ++ [value]
  # end
  # def left_traversal(%{value: value, left: _left, right: right} = tree, acc) do
  #   IO.inspect acc
  #   IO.inspect value
  #   left_traversal(right, acc ++ [value])
  # end
  # def left_traversal(%{value: value, left: left, right: _right}, acc) do
  #   IO.puts "left_traversal left still has a value"
  #   IO.inspect acc
  #   IO.inspect value
  #   left_traversal(left, acc)
  # end

  # def left_traversal(%{value: value, left: _, right: nil}, acc) do
  #   acc ++ value
  # end

  # def sort(tree) do
  #   sort(tree, [])
  # end
  # def sort(tree, acc) do

  # end
  # def insert(nil, value) do
  #   IO.puts "insert/2 NIL: #{value}"
  #   insert(tree(), value)
  # end

  #  def insert(%{value: nil} = tree, value) do
  #   IO.puts "VALUE #{value}"
  #   # IO.inspect v0
  #   Map.put(tree, :value, value)
  # end
  #  def insert(%{value: v0} = tree, value) when value > v0 do
  #   IO.puts "RIGHT #{value}"
  #   IO.inspect v0
  #   insert(Map.put(tree, :right, value), value)
  # end
  # def insert(%{value: v0} = tree, value) when value < v0 do
  #   IO.puts "LEFT #{value}"
  #   IO.inspect v0
  #   insert(Map.get(tree, :left), value)
  # end
  # def insert(tree, key, value) do
  #   IO.puts "insert/2"
  #   # v0 = Map.get(tree, :value)
  #   # case do
  #   #   v0 < value -> insert(Map.get(tree, :left), value)
  #   #   v0 > value -> insert(Map.get(tree, :right), value)
  #   #   _ ->
  #   # end
  #   Map.put(tree, key, value)
  # end

end
