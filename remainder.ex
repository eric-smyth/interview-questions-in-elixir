defmodule Remainder do

  @moduledoc """
  Given 2 integers, return the remainder without using the mod operator
  iex> Remainder.process(20, 3)
  """

  def process(n, d) when n < d, do: n
  def process(n, d) do
    process(n, d, n-d)
  end 
  def process(n, d, diff) when diff >= d do
    process(n, d, diff-d)
  end
  def process(_n, _d, diff), do: diff

end
