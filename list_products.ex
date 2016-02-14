defmodule ListProducts do

  @moduledoc """
  For each index of a list, return the product of all other indexes
  Sample Input: [1, 2, 3, 4]
  Sample Output: [24, 12, 8, 6]
  iex> ListProducts.process([1,2,3,4])
  """

  def process(data) do
    totalProduct = Enum.reduce(data, 1, fn(x, acc) -> x * acc end)
    nonZeroProduct = Enum.reduce(data, 1, fn(x, acc) -> total(x, acc) end)
    numZeroes = Enum.reduce(data, 0, fn(x, acc) -> countZeroes(x, acc) end)
    build_products(numZeroes, data, totalProduct, nonZeroProduct);
  end

  defp build_products(numZeroes, data, totalProduct, _nonZeroProduct) when numZeroes == 0 do
    Enum.into(data, [], fn x -> totalProduct / x end)
  end

  defp build_products(numZeroes, data, _totalProduct, nonZeroProduct) when numZeroes == 1 do
    Enum.into(data, [], fn x -> product(x, nonZeroProduct) end)
  end

  defp build_products(numZeroes, data, _, _) when numZeroes > 1 do
    Enum.into(data, [], fn _x -> 0 end)
  end

  defp countZeroes(x, acc) when x == 0, do: acc + 1
  defp countZeroes(_x, acc), do: acc 

  defp total(x, acc) when x > 0, do: x * acc
  defp total(0, acc), do: acc

  defp product(0, acc), do: acc
  defp product(_x, _acc), do: 0

end
