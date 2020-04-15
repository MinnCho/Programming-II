defmodule Eager do

  def eval_expr({:atm, id}, _) do {:ok, id} end
  def eval_expr({:var, id}, env) do
    case Env.lookup(id, env) do
      nil ->
        :error
      {_, str} ->
        {:ok, str}
    end
  end
  def eval_expr({:cons, head, tail}, env) do
    case eval_expr(head, env) do
      :error ->
        :error
      {:ok, h} ->
        case eval_expr(tail, env) do
          :error ->
            :error
          {:ok, t} ->
            {:ok, [h|t]}
        end
    end
  end
  def eval_expr({:case, expr, cls}, env) do
    case eval_expr(expr, env) do
      :error ->
        :error
      {:ok, str} ->
        eval_cls(cls, str, env)
    end
  end

  def eval_cls([], _, _, _) do
    :error
  end
  def eval_cls([{:clause, ptr, seq} | cls], str, env) do
    ...
    ...
    case ... do
      :fail ->
        eval_cls(..., ..., ...)

      {:ok, env} ->
        eval_seq(..., ...)
    end
  end

  def eval_match(:ignore, _, env) do
    {:ok, env}
  end
  def eval_match({:atm, id}, id, env) do
    {:ok, env}
  end
  def eval_match({:var, id}, str, env) do
    case Env.lookup(id, env) do
      nil ->
        {:ok, Env.add(id, str, env)}
      {_, ^str} ->
        {:ok, env}
      {_, _} ->
        :fail
    end
  end
  def eval_match({:cons, hp, tp}, [h|t], env) do
    case eval_match(hp, h, env) do
      :fail ->
        :fail
      {:ok, env} ->
        eval_match(tp, t, env)
    end
  end
  def eval_match(_, _, _) do
    :fail
  end

  def eval_seq([exp], env) do
    eval_expr(exp, env)
  end
  def eval_seq([{:match, he, exp} | seq], env) do
    case eval_expr(exp, env) do
      :error ->
        :error
      {:ok, str} ->
        vars = extract_vars(he)
        env = Env.remove(vars, env)

        case eval_match(he, str, env) do
          :fail ->
            :error
          {:ok, env} ->
            eval_seq(seq, env)
        end
    end
  end

  def extract_vars(he) do extract_vars(he ,[]) end
  def extract_vars({:atom, _}, acc) do acc end
  def extract_vars({:var, var}, acc) do [var| acc] end
  def extract_vars({:cons, h, t}, acc) do extract_vars(t, extract_vars(h, acc)) end
  def extract_vars(:ignore, acc) do acc end

  def eval(seq) do
    eval_seq(seq, Env.new())
  end

  def test_seq() do
    seq = [{:match, {:var, :x}, {:atm,:a}},
        {:match, {:var, :y}, {:cons, {:var, :x}, {:atm, :b}}},
        {:match, {:cons, :ignore, {:var, :z}}, {:var, :y}},
        {:var, :z}]

    eval(seq)
  end

  def test_cls() do
    seq = [{
      :match, {:var, :x}, {:atm, :a}}, {:case, {:var, :x},
          [{:clause, {:atm, :b}, [{:atm, :ops}]},{:clause, {:atm, :a}, [{:atm, :yes}]}]
        }]

    Eager.eval_seq(seq, [])
  end

end
