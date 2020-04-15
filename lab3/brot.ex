defmodule Brot do

  def mandelbrot(c, m) do
    z0 = Cmplx.new(0, 0)
    i = 0
    test(i, z0, c, m)
  end

  def test(m, _, _, m) do 0 end
  def test(i, z0, c, m) do
    abs = Cmplx.abs(z0)
    zsqr = Cmplx.sqr(z0)
    {:cmplx, cr, ci} = c

    if abs <= 2 do
      {:cmplx, zr, zi} = zsqr
      znew = {:cmplx, zr + cr, zi + ci}
      test(i+1, znew, c, m)
    else
      i
    end
  end

end
