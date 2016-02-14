defmodule NonConsecutiveRepeated do

  @moduledoc """
  Find first repeated word in a string
  iex> NonConsecutiveRepeated.process("the cat was a great cat that like mice")
  """

  def process(string) when is_binary(string) do
    process(String.split(string, " "), %{}, nil)
  end

  defp process([], _, nil), do: "No match found"

  defp process([h|t], map, nil) do
    process(t, Map.put(map, h, h), Map.get(map, h))
  end

  defp process(_, _, val) do
    val
  end

end
