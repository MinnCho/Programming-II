defmodule Removenb do

  def remov_nb(n) do
    sum = add(Enum.to_list(1..n))
    check(1, 1, n, sum, [])
  end

  def add([]) do 0 end
  def add(list) do
    [h|t] = list
    h + add(t)
  end

  def check(n, _, n, _, acc) do Enum.reverse(acc) end
  def check(a, n, n, sum, acc) do check(a + 1, 1, n, sum, acc) end
  def check(a, b, n, sum, acc) do
    cond do
      a * b == (sum - b - a) -> check(a, b + 1, n, sum, [{a, b}, {b, a}| acc])
      a * b != (sum - b - a) -> check(a, b + 1, n, sum, acc)
    end
  end

end
