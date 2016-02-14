defmodule Stock do

  @moduledoc """
  Find the max profit from 1 buy and 1 sell of stock given an array or prices
  iex> Stock.process([5,20,50])
  """

  def process([h | [h1 | t]]), do: process([h1 | t], h, h1-h)
  defp process([], min, profit), do: IO.puts "Profit was: " <> to_string(profit)
  defp process([h|t], min, profit), do: process(t, min(h, min), max(h-min,profit))

end
