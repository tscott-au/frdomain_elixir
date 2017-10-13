defmodule Ch1Test do
  use ExUnit.Case
  doctest Ch1

  test "greets the world" do
    assert Ch1.hello() == :world
  end
end
