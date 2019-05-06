
defmodule TimeMacro do
  defmacro __using__(def) do
    defmacro deftime(function_name, [do: block] = expression) do
      IO.inspect expression
      quote do
        def unquote(function_name) do
          start_time = NaiveDateTime.utc_now()
          result = unquote(block)
          finish_time = NaiveDateTime.utc_now()
          IO.puts("sent #{start_time} and #{finish_time}")

          result
        end
      end
    end
  end
end

defmodule Test do
  import TimeMacro

  deftime show(var \\ "") do
    IO.inspect "the var is #{var}"
    :timer.sleep(500)
    "the var is #{var}"
  end
end

Test.show "cake"

# run with iex macro.exs