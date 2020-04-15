defmodule Philosopher do

  def sleep(0) do :ok end
  def sleep(t) do
    :timer.sleep(:rand.uniform(t))
  end

  def start(hunger, strength, right, left, name, ctrl, seed) do
    spawn_link(fn -> dreaming(hunger, strength, left, right, name, ctrl, seed) end)
  end

  def dreaming(hunger, 0, right, left, name, ctrl, seed)do
    IO.puts("#{name} DIED")
    send(ctrl, :done)
  end
  def dreaming(0, strength, right, left, name, ctrl, seed)do
    IO.puts("#{name} is satisfied, strength is #{strength}")
    send(ctrl, :done)
  end
  def dreaming(hunger, strength, right, left, name, ctrl, seed)do
    IO.puts("#{name} is dreaming")
    sleep(10)
    IO.puts("#{name} wants to eat")
    waitForChop(hunger, strength, right, left, name, ctrl, seed)
  end

  def waitForChop(hunger, strength, right, left, name, ctrl, seed) do
    case Chopstick.request(left) do
      :ok ->
        sleep(10)
        case Chopstick.request(right) do
          :ok ->
          IO.puts("#{name} can eat")
          eat(hunger, strength, left, right, name, ctrl, seed)
          #dreaming(hunger, strength - 1, left, right, name, ctrl,seed)
          :no ->
            IO.puts("works")
            Chopstick.return(left)
            waitForChop(hunger, strength, left, right, name, ctrl, seed)
        end
      :no ->
        Chopstick.return(right)
        waitForChop(hunger, strength, left, right, name, ctrl, seed)
    end
  end

  def eat(hunger, strength, left, right, name, ctrl, seed) do
    IO.puts("#{name} is eating")
    sleep(20)
    Chopstick.return(left)
    Chopstick.return(right)
    dreaming(hunger - 1, strength, left, right, name ,ctrl, seed)
  end

  def wait(0, chopsticks) do
    Enum.each(chopsticks, fn(c) -> Chopstick.quit(c) end)
  end
end
