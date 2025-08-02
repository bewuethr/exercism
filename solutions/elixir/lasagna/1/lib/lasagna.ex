defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(x), do: 40 - x

  def preparation_time_in_minutes(x), do: 2 * x

  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end

  def alarm(), do: "Ding!"
end
