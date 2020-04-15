defmodule Bouncingball do

  def bouncing_ball(h, bounce, window) do
    cond do
      h > 0 && bounce < 1 && bounce > 0 && h > window -> bouncing_ball(h, bounce, window, 0)
      true -> -1
    end
  end
  def bouncing_ball(h, bounce, window, count) do
    cond do
      h * bounce > window -> bouncing_ball(h * bounce, bounce, window, count + 2)
      h * bounce <= window -> count + 1
    end
  end

end
