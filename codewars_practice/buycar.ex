defmodule Buycar do

  def nb_months(startPriceOld, startPriceNew, savingperMonth, percentLossByMonth) do
    nb_months(startPriceOld , startPriceNew , savingperMonth, 0, percentLossByMonth/100 , 0)
  end
  def nb_months(old, new, savingpermonth, saving, ploss, month) do
    cond do
      old + saving < new ->
        cond do
          rem(month, 2) == 0 -> nb_months(old - (ploss * old), new - (ploss * new), savingpermonth, saving + savingpermonth, ploss + 0.005, month + 1)
          rem(month, 2) == 1 -> nb_months(old - (ploss * old), new - (ploss * new), savingpermonth, saving + savingpermonth, ploss, month + 1)
        end
      old + saving >= new ->
          {month , Kernel.round((old + saving) - new)}
    end
  end

end
