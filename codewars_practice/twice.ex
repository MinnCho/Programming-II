defmodule Twice do

    def dbl_linear(n) do
      map = %{0 => 1}
      {:ok, val} = twice(map, 0, 0, 0, n)
      val
    end

    def twice(map, _, _, n, n) do Map.fetch(map, n) end
    def twice(map, xcount, ycount, count, n) do
      {:ok, xval} = Map.fetch(map, xcount)
      {:ok, yval} = Map.fetch(map, ycount)
      x = 2 * xval + 1
      y = 3 * yval + 1
      cond do
        x < y -> twice(Map.put(map, count + 1, x), xcount + 1, ycount, count + 1, n)
        x > y -> twice(Map.put(map, count + 1, y), xcount, ycount + 1, count + 1, n)
        x == y -> twice(Map.put(map, count + 1, x), xcount + 1, ycount + 1, count + 1, n)
      end
    end

end
