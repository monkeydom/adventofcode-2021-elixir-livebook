#!/usr/bin/env elixir

defmodule Recursion do
	def recur({new, d0, d1, d2, d3, d4, d5, d6, d7}) do
	{d0, d1, d2, d3, d4, d5, d6 + new, d7, new}
	end
end

input = """
3,4,3,1,2
"""

input = """
4,3,3,5,4,1,2,1,3,1,1,1,1,1,2,4,1,3,3,1,1,1,1,2,3,1,1,1,4,1,1,2,1,2,2,1,1,1,1,1,5,1,1,2,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,5,1,4,2,1,1,2,1,3,1,1,2,2,1,1,1,1,1,1,1,1,1,1,4,1,3,2,2,3,1,1,1,4,1,1,1,1,5,1,1,1,5,1,1,3,1,1,2,4,1,1,3,2,4,1,1,1,1,1,5,5,1,1,1,1,1,1,4,1,1,1,3,2,1,1,5,1,1,1,1,1,1,1,5,4,1,5,1,3,4,1,1,1,1,2,1,2,1,1,1,2,2,1,2,3,5,1,1,1,1,3,5,1,1,1,2,1,1,4,1,1,5,1,4,1,2,1,3,1,5,1,4,3,1,3,2,1,1,1,2,2,1,1,1,1,4,5,1,1,1,1,1,3,1,3,4,1,1,4,1,1,3,1,3,1,1,4,5,4,3,2,5,1,1,1,1,1,1,2,1,5,2,5,3,1,1,1,1,1,3,1,1,1,1,5,1,2,1,2,1,1,1,1,2,1,1,1,1,1,1,1,3,3,1,1,5,1,3,5,5,1,1,1,2,1,2,1,5,1,1,1,1,2,1,1,1,2,1
"""

fish =
input 
|> String.trim()
|> String.split(",")
|> Enum.map(&String.to_integer/1)

frequencies = 
fish
|> Enum.frequencies()

amounts = Enum.map(0..8, fn i -> frequencies[i] || 0 end) |> List.to_tuple()

amounts
|> IO.inspect()

1..80
|> Enum.reduce(amounts, fn _, amounts -> Recursion.recur(amounts) end)
|> Tuple.sum()
|> IO.inspect()

1..256
|> Enum.reduce(amounts, fn _, amounts -> Recursion.recur(amounts) end)
|> Tuple.sum()
|> IO.inspect()

