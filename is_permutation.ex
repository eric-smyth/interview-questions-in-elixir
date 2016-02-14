defmodule IsPermutation do

  @moduledoc """
  Given 2 strings, determine if one is a permutation of the other
  run with either:
  iex> IsPermutation.process(["cat", "tac"]) - nlogn
  iex> IsPermutation.process("cat", "tac") - n
  """

  defp is_match(x, x), do: :true
  defp is_match(_x, _y), do: :false

  # less optimal solution since requires a sort
  def process([h|[h1|_t]]) do
    a = String.split(h, "") |> Enum.sort
    b = String.split(h1, "") |> Enum.sort
    is_match(a,b)
  end

  def process(a, b) do
    process(String.split(a, "", trim: true), String.split(b, "", trim: true) , %{})
  end

  # not fully baked out, doesn't handle duplicate letters
  defp process(a, b, map) when length(a) == 0 and length(b) == 0 and map_size(map) > 0, do: :false
  defp process(a, b, map) when length(a) == 0 and length(b) == 0 and map_size(map) == 0, do: :true
  defp process(a, b, map) when length(a) == 0 and length(b) > 0 and map_size(map) == 0, do: :false
  defp process(a, b, map) when length(a) == 0 do
    [h | t] = b
    process([], t, Map.delete(map, h))
  end
  defp process(a, b, map) do
    [h | t] = a
    process(t, b, Map.put(map, h, 1))
  end

end
