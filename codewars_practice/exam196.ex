defmodule Exam196 do

  def drop(list, num) do drop(list, num , num) end
  def drop([], _, _) do [] end
  def drop([h|t], 1, numrem) do drop(t, numrem, numrem) end
  def drop([h|t], num, numrem) do
    [h|drop(t, num - 1, numrem)]
  end

  

end
