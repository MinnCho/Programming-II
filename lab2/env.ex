defmodule Env do

  def new() do [] end

  def add(id, str, env) do [{id, str}| env] end

  def lookup(id, []) do :nil end
  def lookup(id, [{id, str}|t]) do {id, str} end
  def lookup(id, [{oid, _}|t]) do lookup(id, t) end

  def remove(ids, env) do remove(ids, env, []) end
  def remove(ids, [], acc) do acc end
  def remove(ids, [{ids, _}| env], acc) do remove(ids, env, acc) end
  def remove(ids, [{id, str}| env], acc) do remove(ids, env, [{id, str}|acc]) end

end
