defmodule GenReport do
  alias GenReport.Parser

  def build(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report ->
      sum_values(line, report)
    end)
  end

  defp sum_values(
         [name, hour, _day, month, eyer],
         %{
           "all_hours" => all_hours,
           "hours_per_month" => hours_per_month,
           "hours_per_year" => hours_per_year
         } = report
       ) do
    all_hours = Map.merge(all_hours, %{name => hour}, fn _k, v1, v2 -> v1 + v2 end)

    hours_per_month = merge_sub(hours_per_month, %{name => %{month => hour}})

    hours_per_year = merge_sub(hours_per_year, %{name => %{eyer => hour}})

    %{
      report
      | "all_hours" => all_hours,
        "hours_per_month" => hours_per_month,
        "hours_per_year" => hours_per_year
    }
  end

  defp merge_sub(left, right) do
    Map.merge(left, right, fn _k, v1, v2 ->
      Map.merge(v1, v2, fn _k, val1, val2 -> val1 + val2 end)
    end)
  end

  defp report_acc() do
    %{
      "all_hours" => %{},
      "hours_per_month" => %{},
      "hours_per_year" => %{}
    }
  end
end
