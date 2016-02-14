defmodule ConsecutiveRepeated do

  @moduledoc """
  Find the first consecutive repeated word
  iex> ConsecutiveRepeated.process("the cat was a great cat that that like mice")
  """

  def process(string) when is_binary(string), do: process(String.split(string))
  def process([h|[h|_t]]), do: h
  def process([_h|t]), do: process(t)
  def process([]), do: "No match found"

end
