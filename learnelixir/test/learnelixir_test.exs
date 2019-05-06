defmodule LearnelixirTest do
  use ExUnit.Case
  doctest Learnelixir

  test "greets the world" do
    assert Learnelixir.hello() == :world
  end

  test "greets the world with a message" do
    assert Learnelixir.hello("message") == "Hello! message"
  end
end
