defmodule Cmplx do

  def new(r, i) do
    {:cmplx, r, i}
  end

  def add({:cmplx, ar, ai}, {:cmplx, br, bi}) do
    {:cmplx, ar + br, ai + bi}
  end

  def sqr({:cmplx, r, i}) do
    {:cmplx, (r * r) - (i * i),  2 * (r * i)}
  end

  def abs({:cmplx, r, i}) do
    :math.sqrt((r * r) + (i * i))
  end

end
