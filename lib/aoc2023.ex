defmodule Aoc2023 do
  defmodule MatchNumbers do
    def number?(text), do: number?(text, "")
    def number?(<<"one", rest::binary>>, acc), do: number?("e" <> rest, acc <> "1")
    def number?(<<"two", rest::binary>>, acc), do: number?("o" <> rest, acc <> "2")
    def number?(<<"three", rest::binary>>, acc), do: number?("e" <> rest, acc <> "3")
    def number?(<<"four", rest::binary>>, acc), do: number?(rest, acc <> "4")
    def number?(<<"five", rest::binary>>, acc), do: number?("e" <> rest, acc <> "5")
    def number?(<<"six", rest::binary>>, acc), do: number?(rest, acc <> "6")
    def number?(<<"seven", rest::binary>>, acc), do: number?("n" <> rest, acc <> "7")
    def number?(<<"eight", rest::binary>>, acc), do: number?("t" <> rest, acc <> "8")
    def number?(<<"nine", rest::binary>>, acc), do: number?("e" <> rest, acc <> "9")
    def number?(<<b, rest::binary>>, acc), do: number?(rest, acc <> <<b>>)
    def number?("", acc), do: acc
  end

  def read_input(day) when is_integer(day) do
    day = String.pad_leading("#{day}", 2, "0")

    Application.app_dir(:aoc2023, "/priv/day-#{day}-input.txt")
    |> File.read!()
    |> String.split()
  end

  def day_01_part_1() do
    read_input(1)
    |> Enum.map(fn line -> {line, String.graphemes(line)} end)
    |> Enum.map(fn {line, chars} ->
      {line, chars |> Enum.filter(fn c -> Enum.member?(~w(0 1 2 3 4 5 6 7 8 9), c) end)}
    end)
    |> Enum.map(fn {line, chars} ->
      {line, chars, (List.first(chars) <> List.last(chars)) |> String.to_integer()}
    end)
    |> Enum.reduce(0, fn {_line, _chars, number}, acc -> number + acc end)
  end

  def day_01_part_2() do
    read_input(1)
    |> Enum.map(fn line -> {line, MatchNumbers.number?(line)} end)
    |> Enum.map(fn {line, parsed} -> {line, String.graphemes(parsed)} end)
    |> Enum.map(fn {line, chars} ->
      {line, chars |> Enum.filter(fn c -> Enum.member?(~w(0 1 2 3 4 5 6 7 8 9), c) end)}
    end)
    |> Enum.map(fn {line, chars} ->
      {line, chars, (List.first(chars) <> List.last(chars)) |> String.to_integer()}
    end)
    # |> Enum.each(&IO.inspect/1)
    |> Enum.reduce(0, fn {_line, _chars, number}, acc -> number + acc end)
  end
end
