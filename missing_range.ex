defmodule MissingRange do

  @moduledoc """
  Given a list of numbers between 0-100, print out the missing numbers and number ranges.
  run with either:
  iex> MissingRange.process([5,9,83,84])
    ["1-4", "6-8", "10-82", "85-99"]
  """

  def process(data) when is_list(data) do
    data = data ++ [100] |> Enum.sort
    Enum.reduce(data, [], fn(x, acc) -> build_range(x, acc) end) |> List.delete_at(0)
  end

  defp build_range(x, []) do
    build_range(x, [0])
  end

  defp build_range(x, [start_num | t]) when x - start_num > 2 do
    [x] ++ t ++ [to_string(start_num+1) <> "-" <> to_string(x-1)]
  end

  defp build_range(x, [start_num | t]) when x - start_num > 1 do
    [x] ++ t ++ [to_string(start_num+1)]
  end

  defp build_range(x, [_start_num | t]) do
    [x] ++ t
  end

end
