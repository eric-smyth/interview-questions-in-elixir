defmodule MergedWords do

  @moduledoc """
  Given 3 strings, determine if the 3rd can be obtained by merging the first 2.
  You can only use a character from a string if you already used the previous one in that string.

  IE, merged_words("a", "b", "ab") = true
  IE, merged_words("ab", "bc", "abbc") = true
  IE, merged_words("ab", "bc", "acbb") = false
  """

  def process(a, b, c) do
    aList = String.split(a, "", trim: true)
    bList = String.split(b, "", trim: true)
    cList = String.split(c, "", trim: true)
    matches(aList, bList, cList)
  end

  def matches(_, _ ,[]) do
    :true
  end

  def matches([h | t], [] , [h | ct]) do
    matches(t, [], ct)
  end

  def matches([], [h | t] , [h | ct]) do
    matches([], t, ct)
  end

  def matches([h| at], [h | bt] ,[h | ct]) do
    matches(at, [h | bt], ct) or matches([h | at], bt, ct)
  end

  def matches([h | t], b , [h | ct]) do
    matches(t, b, ct)
  end

  def matches(a, [h | t] , [h | ct]) do
    matches(a, t, ct)
  end

  def matches(_a, _b , _c) do
    :false
  end

end
