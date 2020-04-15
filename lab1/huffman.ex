defmodule Huffman do
  def sample do
    'the quick brown fox jumps over the lazy dog
    this is a sample text that we will use when we build
    up a table we will only handle lower case letters and
    no punctuation symbols the frequency will of course not
    represent english but it is probably not that far off'
  end

  def text()  do
    'this is something that we should encode'
  end

  def test do
    sample = sample()
    tree = tree(sample)
    encode = encode_table(tree)
    decode = decode_table(tree)
    text = text()
    seq = encode(text, encode)
    decode(seq, decode)
  end

  def tree(sample) do
    freq = freq(sample)
    huffman(freq)
  end

  def freq(sample) do freq(sample,[]) end
  def freq([], freq) do freq end
  def freq([char| rest], freq) do
    freq(rest, update(char, freq))
  end

  def update(char, []) do [{char,1}] end
  def update(char, [{char, n} | freq]) do
    [{char, n+1} | freq]
  end
  def update(char, [h|t]) do
    [h | update(char, t)]
  end

  def huffman(freq) do
    sorted = Enum.sort(freq, fn({_,x},{_,y}) -> x < y end)
    huffman_tree(sorted)
  end

  def huffman_tree([{c, n}]) do c end
  def huffman_tree([{c1, n1}|[{c2, n2}|t]]) do
    huffman_tree(insert({{c1,c2}, n1+n2}, t))
  end

  def insert({c1, n1}, [{c2, n2}|t]) when n1 > n2 do
    [{c2,n2}|insert({c1,n1}, t)]
  end
  def insert({c1, n1}, [{c2, n2}|t]) do
    [{c1,n1}, {c2,n2}|t]
  end
  def insert({c1, n1}, []) do
    [{c1,n1}]
  end

  def encode_table(tree) do encode_table(tree, []) end
  def encode_table({left, right}, table) do
    append(encode_table(left, [0|table]), encode_table(right, [1|table]))
  end
  def encode_table(branch, [h|t]) do
    [{branch, Enum.reverse([h|t])}]
  end

  def append(l ,m) do
    case l do
      [] -> m
      [h|t] -> [h|append(t,m)]
    end
  end

  def encode([], table) do [] end
  def encode([h|t], table) do
    append(lookup(h, table), encode(t, table))
  end

  def lookup(e, [{e, n}|t]) do n end
  def lookup(e, [{c, n}|t]) do
    lookup(e, t)
  end

  def decode_table(tree) do tree end

  def decode(seq, tree), do decode(seq, tree, tree) end
  def decode([], char, _), do [char] end
  def decode([0 | seq], {left, _}, tree) do
    decode(seq, left, tree)
  end
  def decode([1 | seq], {_, right}, tree) do
    decode(seq, right, tree)
  end
  def decode(seq, char, tree) do
    [char | decode(seq, tree, tree)]
  end

end
