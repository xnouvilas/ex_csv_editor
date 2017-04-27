defmodule CsvEditor.ShowTest do
  use ExUnit.Case
  doctest CsvEditor.Show

  setup_all do
    {:ok,
      header: ["head 1", "head 2", "head 3"],
      data: [["cell 1", "cell 2", "cell 3"], ["cell 4", "cell 5", "cell 6"]],
    }
  end

  test "spawn CSV data with header", params do

    expected = {:safe,
      [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
        [[60, "thead", [], 62,
          [60, "tr", [], 62,
            [[60, "th", [], 62, "head 1", 60, 47, "th", 62],
              [60, "th", [], 62, "head 2", 60, 47, "th", 62],
              [60, "th", [], 62, "head 3", 60, 47, "th", 62]], 60, 47, "tr", 62], 60,
          47, "thead", 62],
        [60, "tbody", [], 62,
          [[60, "tr", [], 62,
            [[60, "td", [], 62, "cell 1", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 2", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 3", 60, 47, "td", 62]], 60, 47, "tr", 62],
            [60, "tr", [], 62,
              [[60, "td", [], 62, "cell 4", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 5", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 6", 60, 47, "td", 62]], 60, 47, "tr", 62]], 60,
          47, "tbody", 62]], 60, 47, "table", 62]}

    assert expected == CsvEditor.Show.data([],  params[:data], params[:header])

  end

  test "spawn CSV file with header", params do

    expected = {:safe,
      [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
        [[60, "thead", [], 62,
          [60, "tr", [], 62,
            [[60, "th", [], 62, "head 1", 60, 47, "th", 62],
              [60, "th", [], 62, "head 2", 60, 47, "th", 62],
              [60, "th", [], 62, "head 3", 60, 47, "th", 62]], 60, 47, "tr", 62], 60,
          47, "thead", 62],
        [60, "tbody", [], 62,
          [[60, "tr", [], 62,
            [[60, "td", [], 62, "cell 1", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 2", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 3", 60, 47, "td", 62]], 60, 47, "tr", 62],
            [60, "tr", [], 62,
              [[60, "td", [], 62, "cell 4", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 5", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 6", 60, 47, "td", 62]], 60, 47, "tr", 62]], 60,
          47, "tbody", 62]], 60, 47, "table", 62]}

    assert expected == CsvEditor.Show.data([],  "test/assets/example.csv")

  end

end
