defmodule Snail do

  @doc """

  Converts a matrix to a list by walking around its edges from the top-left going clockwise.

  ![snail walk](http://www.haan.lu/files/2513/8347/2456/snail.png)

  iex> Snail.snail( [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ] )
  [ 1, 2, 3, 6, 9, 8, 7, 4, 5 ]

  """

  @spec snail( [ [ term ] ] ) :: [ term ]

  def snail(matrix) do
    snail(matrix, [])
  end
  def snail([], acc) do List.flatten(Enum.reverse(acc)) end
  def snail(matrix, acc) do
    [h|t] = matrix
    snail(Enum.reverse(transpose(t)), [h|acc])
  end

  def transpose(matrix) do transpose(matrix, []) end
  def transpose([], acc) do rev(acc) end
  def transpose(matrix, acc) do
    [h|t] = matrix
    nacc = column(h, acc)
    transpose(t, nacc)
  end

  def column([], acc) do acc end
  def column(row, []) do
    [h|t] = row
    [[h]| column(t, [])]
  end
  def column(row, acc) do
    [h|t] = row
    [f|l] = acc
    [[h|f]|column(t, l)]
  end

  def rev(matrix) do rev(matrix, []) end
  def rev([], acc) do Enum.reverse(acc) end
  def rev(matrix, acc) do
    [h|t] = matrix
    rev(t, [Enum.reverse(h)| acc])
  end

end
