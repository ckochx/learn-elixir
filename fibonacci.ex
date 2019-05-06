# starting with 0 and 1, print 'n' numbers in the Fibonacci sequence
# where 'n' can be set in the RANGE constant below
#
# (review of the Fibonacci sequence: the numbers are sum's of the
#  preceding two numbers; 0 1 1 2 3 5 ...)
#

defmodule Fibonacci do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) do
    # IO.puts "n = #{n}"
    fib(n-1, 0) + fib(n-2, 0)
  end
  def fib(0, ops)do
    IO.puts "operations count = #{ops}"
    0
  end
  def fib(1, _ops)do
    # IO.puts "operations count = #{ops}"
    1
  end
  def fib(n, ops) do
    IO.puts ops
    # "n_ops = #{ops}"
    fib(n-1, ops+1) + fib(n-2, ops+1)
  end

  def getNumber(n) when n < 0, do: raise "You're trying to find a Fibonacci Number under Zero. Please try again."
  def  getNumber(n), do: getNumber(n, 1, 0)
  defp getNumber(0, _, result), do: result |> IO.inspect()
  defp getNumber(n, next, result), do: getNumber(n-1, next+result, next)

  # def stream(0), do: [0]
  # def stream(n) do
  #   Stream.unfold({1, 1}, fn {a, b} ->
  #     {a, {b, a + b}}
  #   end)
  #   |> Enum.take(n)
  # end
end

ExUnit.start()
defmodule FibonacciTest do
  use ExUnit.Case

  @tag timeout: 300000
  test "recursive fib(20)" do
    refute Fibonacci.fib(20) == nil
  end
  @tag timeout: 300000
  test "recursive fib(40)" do
    refute Fibonacci.fib(40) == nil
  end
  @tag timeout: 300000
  test "recursive fib(60)" do
    refute Fibonacci.fib(60) == nil
  end
  # @tag timeout: 300000
  # test "recursive fib(80)" do
  #   refute Fibonacci.fib(80) == nil
  # end
  # test "stream(n)" do
  #   assert List.last(Fibonacci.stream(10)) == 55
  #   assert List.last(Fibonacci.stream(9)) == 34
  #   assert List.last(Fibonacci.stream(8)) == 21
  #   assert List.last(Fibonacci.stream(7)) == 13
  #   assert List.last(Fibonacci.stream(1)) == 1
  #   assert List.last(Fibonacci.stream(0)) == 0
  #   # assert Fibonacci.fib(50) == 55
  # end
  # test "reduce 10" do
  #   assert Fibonacci.map(10) == 55
  #   assert Fibonacci.map(9) == 34
  #   assert Fibonacci.map(8) == 21
  #   assert Fibonacci.map(7) == 13
  #   assert Fibonacci.map(1) == 1
  #   assert Fibonacci.map(0) == 0
  #   # assert Fibonacci.map(100) == 354224848179261915075
  # end

  test "tail call optimized" do
    assert Fibonacci.getNumber(10) == 55
    assert Fibonacci.getNumber(9) == 34
    assert Fibonacci.getNumber(8) == 21
    assert Fibonacci.getNumber(7) == 13
    assert Fibonacci.getNumber(1) == 1
    assert Fibonacci.getNumber(0) == 0
    assert Fibonacci.getNumber(100) == 354224848179261915075
  end

  # @tag timeout: 300000
  # test "stream large vals" do
  #   IO.puts "START stream #{inspect(Time.utc_now())}"
  #   refute Fibonacci.stream(100) == :error
  #   IO.puts "100 #{inspect(Time.utc_now())}"
  #   refute Fibonacci.stream(1000) == :error
  #   IO.puts "1000 #{inspect(Time.utc_now())}"
  #   refute Fibonacci.stream(10000) == :error
  #   IO.puts "10000 #{inspect(Time.utc_now())}"
  #   refute Fibonacci.stream(100000) == :error
  #   IO.puts "100000 #{inspect(Time.utc_now())}"
  #   # refute Fibonacci.stream(1000000) == :error
  #   # IO.puts "1000000 #{inspect(Time.utc_now())}"
  #   # refute Fibonacci.stream(10000000) == :error
  #   # IO.puts "10000000 #{inspect(Time.utc_now())}"
  #   # refute Fibonacci.stream(100000000) == :error
  #   IO.puts "FINISH #{inspect(Time.utc_now())}"
  # end

  # @tag timeout: 300000
  # test "large vals 10" do
  #   IO.puts "START getNumber #{inspect(Time.utc_now())}"
  #   refute Fibonacci.getNumber(100) == :error
  #   IO.puts "100 #{inspect(Time.utc_now())}"
  #   refute Fibonacci.getNumber(1000) == :error
  #   IO.puts "1000 #{inspect(Time.utc_now())}"
  #   refute Fibonacci.getNumber(10000) == :error
  #   IO.puts "10000 #{inspect(Time.utc_now())}"
  #   refute Fibonacci.getNumber(100000) == :error
  #   IO.puts "100000 #{inspect(Time.utc_now())}"
  #   refute Fibonacci.getNumber(1000000) == :error
  #   IO.puts "1000000 #{inspect(Time.utc_now())}"
  #   # refute Fibonacci.getNumber(10000000) == :error
  #   # IO.puts "10000000 #{inspect(Time.utc_now())}"
  #   # refute Fibonacci.getNumber(100000000) == :error
  #   IO.puts "FINISH #{inspect(Time.utc_now())}"
  # end
end

























# defmodule Fibonacci do

#   def fib(limit) do
#     # range = Enum.to_list(0..limit)
#     fib(0, 1, 0, limit)
#   end
#   def fib(_, _, _, 0) do
#     0
#   end
#   def fib(_, _, _, 1) do
#     1
#   end
#   def fib(sum, e1, count, limit)  when limit == count do
#     IO.inspect("val-1= #{e1}, count=#{count}, limit=#{limit}, sum = #{sum}")
#     sum
#   end
#   def fib(e0, e1, count, limit) do
#     fib(e0 + e1, e0, count + 1, limit)
#   end

#   def tail_fib(limit) do
#     # range = Enum.to_list(0..limit)
#     tail_fib(limit-1, 1, 1, limit)
#   end
#   def tail_fib(e, _e1, _sum, limit) when e < 0 do
#     0
#   end
#   def tail_fib(0, e1, sum, limit) do
#     IO.inspect("TAIL_FIB limit = #{limit}, val-1= #{e1}, sum = #{sum}")
#     e1
#   end
#   def tail_fib(1, e1, sum, limit) do
#     IO.inspect("TAIL_FIB limit = #{limit}, val-1= #{e1}, sum = #{sum}")
#     sum
#   end
#   def tail_fib(e0, e1, sum, limit) do
#     tail_fib(e0 - 1, sum, sum + e1, limit)
#   end

#   def getNumber(n) when n < 0, do: raise "You're trying to find a Fibonacci Number under Zero. Please try again."
#   def  getNumber(n), do: getNumber(n, 1, 0)
#   defp getNumber(0, _, result), do: result
#   defp getNumber(n, next, result), do: getNumber(n-1, next+result, next)
# end

# ExUnit.start
# defmodule FibonacciTest do
#   use ExUnit.Case

#   test "fib/1 takes a limit as the argument" do
#     refute Fibonacci.fib(10) == :error
#   end
#   test "fib(0) returns 0" do
#     assert Fibonacci.fib(0) == 0
#   end
#   test "fib(1) returns 1" do
#     assert Fibonacci.fib(1) == 1
#   end
#   test "fib(2) returns 1" do
#     assert Fibonacci.fib(2) == 1
#   end
#   test "fib(3) == 2" do
#     assert Fibonacci.fib(3) == 2
#   end
#   test "fib(4) == 3" do
#     assert Fibonacci.fib(4) == 3
#   end
#   test "fib(5) == 5" do
#     assert Fibonacci.fib(5) == 5
#   end
#   test "fib(6) == 8" do
#     assert Fibonacci.fib(6) == 8
#   end
#   test "fib(7) == 13" do
#     assert Fibonacci.fib(7) == 13
#   end
#   test "fib(8) == 21" do
#     assert Fibonacci.fib(8) == 21
#   end
#   test "fib(x) when x gets large" do
#     IO.puts(inspect Time.utc_now())
#     assert Fibonacci.fib(1000) == 43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875
#     IO.puts(inspect Time.utc_now())
#     # assert is_number(Fibonacci.fib(100_000))
#     # IO.puts(inspect Time.utc_now())
#     # assert is_number(Fibonacci.fib(1_000_000))
#     # IO.puts(inspect Time.utc_now())
#     # assert is_number(Fibonacci.fib(10_000_000))
#     # IO.puts(inspect Time.utc_now())
#     # refute Fibonacci.fib(1_000_000_000) == :error
#   end

#   test "tail_fib(8) == 21" do
#     assert Fibonacci.tail_fib(8) == 21
#   end
#   @tag timeout: 300_000
#   test "tail_fib(x) when x gets large" do
#     IO.puts(inspect "START tail_fib #{Time.utc_now()}")
#     assert Fibonacci.tail_fib(1000) == 43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875
#     IO.puts(inspect "n=1000 #{Time.utc_now()}")
#     # assert is_number(Fibonacci.tail_fib(100_000))
#     # IO.puts(inspect "n=100_000 #{Time.utc_now()}")
#     # assert is_number(Fibonacci.tail_fib(1_000_000))
#     # IO.puts(inspect "n=1_000_000 #{Time.utc_now()}")
#     # assert is_number(Fibonacci.tail_fib(10_000_000))
#     # IO.puts(inspect "n=10_000_000 #{Time.utc_now()}")
#   end

#   test "tail_fib(0) returns 0" do
#     assert Fibonacci.tail_fib(0) == 0
#   end
#   test "tail_fib(1) returns 1" do
#     assert Fibonacci.tail_fib(1) == 1
#   end
#   test "tail_fib(2) returns 1" do
#     assert Fibonacci.tail_fib(2) == 1
#   end
#   test "tail_fib(3) == 2" do
#     assert Fibonacci.tail_fib(3) == 2
#   end

#   test "getNumber(8) == 21" do
#     assert Fibonacci.getNumber(8) == 21
#   end
#   @tag timeout: 300_000
#   test "getNumber(x) when x gets large" do
#     IO.puts(inspect "START getNumber #{Time.utc_now()}")
#     assert Fibonacci.getNumber(1000) == 43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875
#     IO.puts(inspect "n=1000 #{Time.utc_now()}")
#     assert is_number(Fibonacci.getNumber(100_000))
#     IO.puts(inspect "n=100_000 #{Time.utc_now()}")
#     assert is_number(Fibonacci.getNumber(1_000_000))
#     IO.puts(inspect "n=1_000_000 #{Time.utc_now()}")
#     # assert is_number(Fibonacci.getNumber(10_000_000))
#     # IO.puts(inspect "n=10_000_000 #{Time.utc_now()}")
#     # refute Fibonacci.fib(1_000_000_000) == :error
#   end

#   test "getNumber(0) returns 0" do
#     assert Fibonacci.getNumber(0) == 0
#   end
#   test "getNumber(1) returns 1" do
#     assert Fibonacci.getNumber(1) == 1
#   end
#   test "getNumber(2) returns 1" do
#     assert Fibonacci.getNumber(2) == 1
#   end
#   test "getNumber(3) == 2" do
#     assert Fibonacci.getNumber(3) == 2
#   end
# end