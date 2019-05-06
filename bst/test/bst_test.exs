defmodule BstTest do
  use ExUnit.Case
  use ExUnitProperties
  # doctest Bst

  test "first" do
    assert Bst.insert(:leaf, 2) == %{value: 2, left: nil, right: nil}
  end

  test "second" do
    bstree = Bst.insert(:leaf, 2)
    assert Bst.insert(bstree, 3) == %{value: 2, left: nil, right: %{value: 3, left: nil, right: nil}}
  end

  test "third" do
    bstree = Bst.insert(:leaf, 2)
    |> Bst.insert(3)
    assert Bst.insert(bstree, 4) == %{value: 2, left: nil, right: %{value: 3, left: nil, right: %{value: 4, left: nil, right: nil}}}
  end

  test "fourth" do
    bstree = Bst.insert(:leaf, 2)
    |> Bst.insert(3)
    |> Bst.insert(4)
    assert Bst.insert(bstree, 1) == %{value: 2, left: %{value: 1, left: nil, right: nil}, right: %{value: 3, left: nil, right: %{value: 4, left: nil, right: nil}}}
  end

  describe "left_traversal" do
    test "sorted list" do
      bstree = Bst.insert(:leaf, 2)
      |> Bst.insert(3)
      |> Bst.insert(4)
      |> Bst.insert(1)
      sorted = Bst.left_traversal(bstree)
      assert sorted == [1,2,3,4]
    end

  end

  describe "properties" do
    property "reversing a list doesn't change its length" do
      check all list <- list_of(integer()) do
        assert length(list) == length(:lists.reverse(list))
      end
    end
  end
end


# property "sum of positive integer is greater than both integers" do
#   check all
#     list <- list_of(term()),
#     list != [],
#     elem <- member_of(list) do
#       assert elem in list
#     end
#   end
# end
