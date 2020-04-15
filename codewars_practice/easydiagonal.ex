defmodule Easydiagonal do

  def diagonal(0, _) do 0 end
  def diagonal(n, p) do
    pascal(n, p) + diagonal(n - 1, p)
  end

  def pascal(_, 0) do 1 end
  def pascal(n, n) do 1 end
  def pascal(n, p) do
    pascal(n, p - 1) * (n + 1 - p)/p
  end

end
