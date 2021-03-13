defmodule GenReportTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file_name = "gen_test.csv"

      response = GenReport.build(file_name)

      expected_response = %{
        all_hours: %{
          Cleiton: 12,
          Daniele: 21,
          Danilo: 7,
          Diego: 12,
          Giuliano: 14,
          Jakeliny: 22,
          Joseph: 13,
          Mayk: 19,
          Rafael: 7
        },
        hours_per_month: %{
          Cleiton: %{junio: 4, outubro: 8},
          Daniele: %{abril: 7, dezembro: 5, junio: 1, maio: 8},
          Danilo: %{abril: 1, fevereiro: 6},
          Diego: %{abril: 4, agosto: 4, dezembro: 1, setembro: 3},
          Giuliano: %{abril: 1, fevereiro: 9, maio: 4},
          Jakeliny: %{julho: 8, março: 14},
          Joseph: %{dezembro: 2, março: 3, novembro: 5, setembro: 3},
          Mayk: %{dezembro: 5, julho: 7, setembro: 7},
          Rafael: %{julho: 7}
        },
        hours_per_year: %{
          Cleiton: %{"2016": 3, "2020": 9},
          Daniele: %{"2016": 10, "2017": 3, "2018": 7, "2020": 1},
          Danilo: %{"2018": 1, "2019": 6},
          Diego: %{"2016": 3, "2017": 8, "2019": 1},
          Giuliano: %{"2017": 3, "2019": 6, "2020": 5},
          Jakeliny: %{"2016": 8, "2017": 8, "2019": 6},
          Joseph: %{"2017": 3, "2019": 3, "2020": 7},
          Mayk: %{"2016": 7, "2017": 8, "2019": 4},
          Rafael: %{"2017": 7}
        }
      }

      assert response == expected_response
    end
  end
end
