defmodule ArabicToRoman do
  def solution(number) do solution(number, [], 1000) end
  def solution(_, acc, 0) do Enum.join(Enum.reverse(acc)) end
  def solution(0, acc, _) do Enum.join(Enum.reverse(acc)) end
  def solution(number, acc, count) do
      f = div(number, count)
      newcount = trunc(count/10)
      sol = conv(f, count, newcount)
      solution(rem(number, count), [sol|acc], newcount)
  end

  def conv(0, count, newcount) do "" end
  def conv(f, count, newcount) do
    cond  do
      f < 4 -> Enum.join([base(count), conv(f - 1, count, newcount)])
      f == 4 -> Enum.join([base(count), base(5 * count)])
      4 < f && f < 9 -> Enum.join([base(5 * count), conv(f - 5, count, newcount)])
      f == 9 -> Enum.join([base(count), base(10 * count)])
    end
  end

  def base(num) do
   case num do
     0 -> ""
     1 -> "I"
     5 -> "V"
     10 -> "X"
     50 -> "L"
     100 -> "C"
     500 -> "D"
     1000 -> "M"
   end
  end
end
