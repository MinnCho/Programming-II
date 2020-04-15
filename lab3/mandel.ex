defmodule Mandel do

  def mandelbrot(width, height, x, y, k, depth) do
    trans = fn(w, h) ->
      Cmplx.new(x + k * (w - 1), y - k * (h - 1))
    end
    widthval = width
    rows(width, widthval, height, trans, depth, [], [])
  end

  def rows(_, _, 0, _, _, colors, _) do colors end
  def rows(0, widthval, height, trans, depth, colors, color) do
    width = widthval
    rows(width, widthval, height - 1, trans, depth, [color|colors], [])
  end
  def rows(width, widthval, height, trans, depth, colors, color) do
    c = trans.(width, height)
    brot = Brot.mandelbrot(c, depth)
    col = Color.convert(brot, depth)
    rows(width - 1, widthval, height, trans, depth, colors, [col|color])
  end

end
