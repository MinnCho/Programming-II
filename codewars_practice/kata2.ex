defmodule Kata2 do
  def sum_of_intervals(a) do
    [h|t] = a
    overlap(h, t, [])
  end

  def overlap(h, [f|l], acc)
    {h1, h2} = h
    {f1, f2} = f
    cond do
      h1 >= f1 && h1 < f2 && -> overlap(h, l, [{}])
    end
  end

end
