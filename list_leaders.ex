defmodule ListLeaders do

  @moduledoc """
  Given a list of numbers, return all the leaders.  A leader
  is bigger than every number to the right of it.

  iex> ListLeaders.process([5, 10, 8, 4, 6, 2, 7, 1])
       [1, 7, 8, 10]
  """

  def process(data) do
    [current_max|t] = Enum.reverse(data)
    process(t, [current_max], current_max)
  end

  def process([h|t], acc, current_max) when h > current_max do
    process(t,[h] ++ acc, h)
  end

  def process([h|t], acc, current_max) do
    process(t,acc, current_max)
  end

  def process([], acc, current_max) do
    Enum.reverse(acc)
  end

end
