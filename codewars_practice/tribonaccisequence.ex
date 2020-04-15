defmodule TribonacciSequence do

  @spec tribonacci({number, number, number}, non_neg_integer) :: [number]
  def tribonacci(signature, n) do
    {n1, n2, n3} = signature
    trib(n1, n2, n3, n)
  end

  def trib()
  def trib(n1 ,n2, n3, n) do trib(n2, n3, n1 + n2 + n3, n - 1) end

end
