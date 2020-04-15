defmodule RecreationOne do
  def list_squared(m, n) do list_squared(m, n, []) end
  def list_squared(n, n, acc) do Enum.reverse(acc) end
  def list_squared(m, n, acc) do
    sqr = square(findDiv(m))
    if (:math.sqrt(sqr) - trunc(:math.sqrt(sqr))) == 0 do
      list_squared(m + 1, n, [{m, sqr}| acc])
    else
      list_squared(m + 1, n, acc)
    end
  end

  def square([]) do 0 end
  def square(list) do
    [h|t] = list
    h * h + square(t)
  end

  def findDiv(num) do findDiv(num, 1, []) end
  def findDiv(num, num, acc) do [num| acc] end
  def findDiv(num, div, acc) do
    cond do
      rem(num, div) == 0 -> findDiv(num, div + 1, [div| acc])
      rem(num, div) != 0 -> findDiv(num, div + 1, acc)
    end
  end

end
