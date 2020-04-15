defmodule StepPrimes do

    def step(g, m, n) do
      primes = findprimes(m,n,g)
    end

    def findprimes(m, n, step) do findprimes(m, n + 1, step, []) end
    def findprimes(n, n, step, acc) do Enum.reverse(acc) end
    def findprimes(m, n, step, acc) do
      check = :math.sqrt(m)
      case isprime(m, trunc(check)) do
        :true ->
          if isprime(m + step, trunc(:math.sqrt(m + step))) == :true do
            [m, m + step]
          else
            findprimes(m + 1, n, step, acc)
          end
        :false -> findprimes(m + 1, n, step, acc)
      end
    end

    def isprime(num, 1) do :true end
    def isprime(num, check) do
      if rem(num, check) != 0 do
        isprime(num, check - 1)
      else
        :false
      end
    end

end
