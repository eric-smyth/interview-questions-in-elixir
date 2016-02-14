defmodule IsRotation do

  @moduledoc """
  Given 2 strings, determine if one is a rotation of the other
  IE, is_rotation("because", "causebe") = true
  IE, is_rotation("because", "becuase") = false

  iex> IsRotation.process("because", "causebe")
  """

  def process(a, b), do: process(a<>a, b, :continue)
  defp process(a, b, :continue), do: String.contains?(a, b)

end
