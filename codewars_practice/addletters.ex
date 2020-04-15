defmodule AddLetters do

  def add_letters([h|t]) do add_letters([h|t], []) end
  def add_letters([], sum) do List.to_string([add(sum) + 96]) end
  def add_letters([h|t], sum) do
    add_letters(t, [to_int(h)|sum])
  end

  def to_int(letter) do
    :binary.first(letter) - 96
  end

  def add([]) do 0 end
  def add([h|t]) do
    sum = h + add(t)
    check(sum)
  end
  def add(last) do last end

  def check(num)do
    if num > 26 do
      newnum = (num - 26)
    else
      num
    end
  end


end
