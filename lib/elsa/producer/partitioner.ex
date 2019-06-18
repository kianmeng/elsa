defmodule Elsa.Producer.Partitioner do
  def partition(:random, partition_count, _key) do
    :crypto.rand_uniform(0, partition_count)
  end

  def partition(:md5, partition_count, key) do
    :crypto.hash(:md5, key)
    |> :binary.bin_to_list()
    |> Enum.sum()
    |> rem(partition_count)
  end
end