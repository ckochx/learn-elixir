


# print to standard out the numbers 1 to an arbitrary limit inclusive

# for any number that is a multiple of 3, print "fizz" instead
# for any number that is a multiple of 5, print "buzz" instead
# for any number that is a multiple of both 3 and 5, print "fizzbuzz" instead




defmodule FizzBuzz do

  def run(limit) when is_number limit do
    Enum.to_list(1..limit)
    |> run()
  end
  def run(range) when is_list range do
    # Enum.map(range, &recursive(&1))
    recursive(range, [])
  end
  def run(val), do: {:error, "#{inspect val} is neither a number nor a list"}

  def tail_call(limit) when is_number limit do
    Enum.to_list(1..limit)
    |> tail_call()
  end
  def tail_call(range) when is_list range do
    Enum.map(range, &recursive(&1))
  end

# map List -> fn/1 >> List
# reduce List -> fn/2 el, accumulator >> accumulator
# map_reduce

  def recursive([], acc) do
    # IO.inspect(acc)
    Enum.count(acc)
    |> IO.puts()
    acc
  end
  def recursive([head | tail], acc) do
    acc = cond do
      Integer.mod(head, 15) == 0 -> List.insert_at(acc, -1, "fizzbuzz")
      Integer.mod(head, 5) == 0 -> List.insert_at(acc, -1, "buzz")
      Integer.mod(head, 3) == 0 -> List.insert_at(acc, -1, "fizz")
      true -> List.insert_at(acc, -1, head)
    end
    recursive(tail, acc)
  end


  def recursive(el) do
    cond do
      Integer.mod(el, 15) == 0 -> "fizzbuzz"
      Integer.mod(el, 5) == 0 -> "buzz"
      Integer.mod(el, 3) == 0 -> "fizz"
      true -> el
    end
    |> IO.inspect()
  end
end

ExUnit.start()
defmodule FizzBuzzTest do
  use ExUnit.Case

  test "run/1 takes a limit as the argument" do
    refute FizzBuzz.run(4) == :error
    assert FizzBuzz.run(4) == [1,2,"fizz",4]
  end
  test "run/1 errors when non-numberic" do
    assert FizzBuzz.run("a String") == {:error, "\"a String\" is neither a number nor a list"}
  end
  test "run(3) == 1, 2, 'fizz'" do
    assert FizzBuzz.run([1,2,3]) == [1,2,"fizz"]
  end

  test "run/1 handles very large limits" do
    IO.inspect(Time.utc_now())
    refute FizzBuzz.tail_call(10_000) == :error
    IO.puts "10_000 vals"
    IO.inspect(Time.utc_now())

    refute FizzBuzz.run(50) == :error
    IO.puts "50 vals"
    IO.inspect(Time.utc_now())
    IO.puts "approx 2000x slower without tail-call optimization"
  end

  # @tag timeout: 300000
  # test "run/1 handles even larger limits" do
  #   IO.inspect(Time.utc_now())
  #   refute FizzBuzz.tail_call(100_000_000) == :error
  #   IO.puts "100_000_000 vals"
  #   IO.inspect(Time.utc_now())

  #   refute FizzBuzz.run(50000) == :error
  #   IO.puts "50000 vals"
  #   IO.inspect(Time.utc_now())
  #   IO.puts "approx 2000x slower without tail-call optimization"
  # end
end


