defmodule Divisible13 do

  def thirt(n) do
    list = Integer.digits(n, 10)
    thirteen = [1, 10, 9, 12, 3, 4]
    m = div(Enum.reverse(list), thirteen, thirteen)
    if m == n do
      m
    else
      thirt(m)
    end
  end

  def div([], _, _) do 0 end
  def div(list, [], thirtrem) do div(list, thirtrem, thirtrem) end
  def div(list, thirt, thirtrem) do
    [h|t] = list
    [f|l] = thirt
    h * f + div(t, l, thirtrem)
  end

end
