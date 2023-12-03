defmodule Aoc2023Test do
  use ExUnit.Case
  doctest Aoc2023

  test "textual_calibration" do
    ~w(
    oneight
    twone
    threeight
    four
    fiveight
    six
    sevenine
    eighthree
    eightwo
    nineight
    )
    |> Enum.map(&Aoc2023.MatchNumbers.number?/1)
    |> Enum.map(&String.graphemes/1)
    |> Enum.each(&IO.inspect/1)
  end
end
