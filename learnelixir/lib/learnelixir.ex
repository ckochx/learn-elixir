defmodule Learnelixir do
  @moduledoc """
  Documentation for Learnelixir.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Learnelixir.hello
      :world

  """
  def hello do
    :world
  end

  def hello(message) do
    IO.puts("Hello " <> message)
    "Hello #{message}"
  end
end
