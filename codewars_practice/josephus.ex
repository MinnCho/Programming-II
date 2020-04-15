defmodule Josephus do
  def permutation(items, k) do
    josephus(items, k - 1, k - 1, [])
  end

  def josephus([survivor], _, _, acc) do Enum.reverse([survivor|acc]) end
  def josephus(list, pos, k, acc) do
    length = Kernel.length(list)
    cond do
      length > pos -> josephus(List.delete_at(list, pos), pos + k, k, [Enum.at(list, pos) | acc])
      length <= pos -> josephus(list, pos - length, k, acc)
    end
  end
end
