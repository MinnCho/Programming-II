defmodule Kpremiers do

    def count_Kprimes(k, start, nd) do
      iskprime(k, start, nd)
    end

    def iskprime(k, start, nd) do iskprime(k, start, nd, []) end
    def iskprime(_, nd, nd, acc) do Enum.reverse(acc) end
    def iskprime(k, start, nd, acc) do
      if kprime(start) == k do
        iskprime(k, start + 1, nd, [start| acc])
      else
        iskprime(k, start + 1, nd, acc)
      end
    end

    def kprime(num) do kprime(num, 2, 0) end
    def kprime(1, _, count) do count end
    def kprime(num, div, count) when rem(num, div) == 0 do
      kprime(div(num, div), div, count + 1)
    end
    def kprime(num, div, count) do kprime(num, div + 1, count)end

    def puzzle(s) do
      a = Enum.reverse(count_Kprimes(1, 1, s))
      b = Enum.reverse(count_Kprimes(3, 1, s))
      c = Enum.reverse(count_Kprimes(7, 1, s))
      
    end
end
