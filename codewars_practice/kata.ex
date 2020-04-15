defmodule Kata do
    def rgb(r,g,b) do
      r = toHex(r)
      g = toHex(g)
      b = toHex(b)
      Enum.join(Enum.reverse(r ++ g ++ b))
    end

    def toHex(num) do toHex(num, []) end
    def toHex(0, []) do ["00"] end
    def toHex(0, acc) do ["0"|acc] end
    def toHex(num, []) when num > 255 do toHex(255, []) end
    def toHex(num, acc) do
        toHex(div(num,16),[hex(rem(trunc(num), 16))| acc])
    end

    def hex(num) do
      cond do
        num == 10 -> "A"
        num == 11 -> "B"
        num == 12 -> "C"
        num == 13 -> "D"
        num == 14 -> "E"
        num == 15 -> "F"
        num < 0 -> "0"
        num -> num
      end
    end
end
