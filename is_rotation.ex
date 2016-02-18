defmodule IsRotation do

  @moduledoc """
  Given 2 strings, determine if one is a rotation of the other
  IE, is_rotation("because", "causebe") = true
  IE, is_rotation("because", "becuase") = false

  iex> IsRotation.process("because", "causebe")
  """

  def process(a, b), do: process(a, b, (String.length(a) == String.length(b)))
  def process(a, b, true), do: String.contains?(a<>a, b) 
  def process(_a, _b, false), do: :false 

end
