defmodule CsvEditor.ShowTest do
  use ExUnit.Case
  doctest CsvEditor.Show

  setup_all do
    {:ok,
      header: ["head 1", "head 2", "head 3"],
      data: [["cell 1", "cell 2", "cell 3"], ["cell 4", "cell 5", "cell 6"]],
    }
  end

  test "spawn CSV data without header and body" do

    expected = [[], []]

    assert expected == CsvEditor.Show.data({[]})

  end

  test "spawn CSV data with header", params do

    expected = [{:safe,
      [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
        [[60, "thead", [], 62,
          [60, "tr", [], 62,
            [[60, "th", [], 62, "", 60, 47, "th", 62],
            [
              [60, "th", [], 62, "head 1", 60, 47, "th", 62],
              [60, "th", [], 62, "head 2", 60, 47, "th", 62],
              [60, "th", [], 62, "head 3", 60, 47, "th", 62]]
            ], 60, 47, "tr", 62], 60, 47, "thead", 62],
        [60, "tbody", [], 62,
          [[60, "tr", [], 62,
            [[60, "th", [], 62, "1", 60, 47, "th", 62],
            [[60, "td", [], 62, "cell 1", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 2", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 3", 60, 47, "td", 62]]
          ], 60, 47, "tr", 62],
          [60, "tr", [], 62,
            [[60, "th", [], 62, "2", 60, 47, "th", 62],
            [[60, "td", [], 62, "cell 4", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 5", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 6", 60, 47, "td", 62]]
          ], 60, 47, "tr", 62]
        ], 60, 47, "tbody", 62]
      ], 60, 47, "table", 62]}, []]

    assert expected == CsvEditor.Show.data({params[:header], params[:data]})

  end

  test "spawn CSV data without header", params do

    expected = [{:safe,
      [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
        [[60, "tbody", [], 62,
          [[60, "tr", [], 62,
            [[60, "th", [], 62, "1", 60, 47, "th", 62],
            [[60, "td", [], 62, "cell 1", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 2", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 3", 60, 47, "td", 62]]
          ], 60, 47, "tr", 62],
          [60, "tr", [], 62,
            [[60, "th", [], 62, "2", 60, 47, "th", 62],
            [[60, "td", [], 62, "cell 4", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 5", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 6", 60, 47, "td", 62]]
          ], 60, 47, "tr", 62]
        ], 60, 47, "tbody", 62]
      ], 60, 47, "table", 62]}, []]

    assert expected == CsvEditor.Show.data({params[:data]})

  end

  test "spawn CSV data without page", params do

    expected = [{:safe,
      [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
        [[60, "tbody", [], 62,
          [[60, "tr", [], 62,
            [[60, "th", [], 62, "1", 60, 47, "th", 62],
            [[60, "td", [], 62, "cell 1", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 2", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 3", 60, 47, "td", 62]]
          ], 60, 47, "tr", 62],
          [60, "tr", [], 62,
            [[60, "th", [], 62, "2", 60, 47, "th", 62],
            [[60, "td", [], 62, "cell 4", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 5", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 6", 60, 47, "td", 62]]
          ], 60, 47, "tr", 62]
        ], 60, 47, "tbody", 62]
      ], 60, 47, "table", 62]}, []]

    assert expected == CsvEditor.Show.data({params[:data]}, nil)

  end

  test "spawn CSV file with header" do

    expected = [{:safe,
      [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
        [[60, "thead", [], 62,
          [60, "tr", [], 62,
            [[60, "th", [], 62, "", 60, 47, "th", 62],
            [
              [60, "th", [], 62, "head 1", 60, 47, "th", 62],
              [60, "th", [], 62, "head 2", 60, 47, "th", 62],
              [60, "th", [], 62, "head 3", 60, 47, "th", 62]
            ]
          ], 60, 47, "tr", 62], 60, 47, "thead", 62],
        [60, "tbody", [], 62,
          [[60, "tr", [], 62,
            [[60, "th", [], 62, "1", 60, 47, "th", 62],
            [
              [60, "td", [], 62, "cell 1", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 2", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 3", 60, 47, "td", 62]
            ]
          ], 60, 47, "tr", 62],
          [60, "tr", [], 62,
            [[60, "th", [], 62, "2", 60, 47, "th", 62],
            [
              [60, "td", [], 62, "cell 4", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 5", 60, 47, "td", 62],
              [60, "td", [], 62, "cell 6", 60, 47, "td", 62]
            ]
          ], 60, 47, "tr", 62]
        ], 60, 47, "tbody", 62]
      ], 60, 47, "table", 62]}, []]

    assert expected == CsvEditor.Show.data("test/assets/example.csv")

  end

  test "spawn CSV file with pager" do

    expected = [60, "ul", [[32, "class", 61, 34, "pagination", 34], [32, "role", 61, 34, "pagination", 34]], 62, [
      [60, "li", [[32, "class", 61, 34, "current", 34]], 62,
        [60, "span", [[32, "class", 61, 34, "", 34]], 62, "1", 60, 47, "span", 62], 60, 47, "li", 62],
      [60, "li", [[32, "class", 61, 34, "", 34]], 62,
        [60, "a", [[32, "class", 61, 34, "", 34], [32, "href", 61, 34, "?page=2", 34]], 62, "2", 60, 47, "a", 62], 60, 47, "li", 62]
    ], 60, 47, "ul", 62]

    [safe: _, safe: pager] = CsvEditor.Show.data("test/assets/example-pager.csv")

    assert expected == pager

  end

  test "spawn CSV file with page size" do

    expected = [60, "ul", [[32, "class", 61, 34, "pagination", 34], [32, "role", 61, 34, "pagination", 34]], 62, [
      [60, "li", [[32, "class", 61, 34, "", 34]], 62,
        [60, "a", [[32, "class", 61, 34, "", 34], [32, "href", 61, 34, "?page_size=15&amp;page=1", 34]], 62, "1", 60, 47, "a", 62], 60, 47, "li", 62],
      [60, "li", [[32, "class", 61, 34, "", 34]], 62,
        [60, "a", [[32, "class", 61, 34, "", 34], [32, "href", 61, 34, "?page_size=15&amp;page=2", 34]], 62, "2", 60, 47, "a", 62], 60, 47, "li", 62],
      [60, "li", [[32, "class", 61, 34, "current", 34]], 62,
        [60, "span", [[32, "class", 61, 34, "", 34]], 62, "3", 60, 47, "span", 62], 60, 47, "li", 62],
      [60, "li", [[32, "class", 61, 34, "", 34]], 62,
        [60, "a", [[32, "class", 61, 34, "", 34], [32, "href", 61, 34, "?page_size=15&amp;page=4", 34]
    ], 62, "4", 60, 47, "a", 62], 60, 47, "li", 62]], 60, 47, "ul", 62]

    [safe: _, safe: pager] = CsvEditor.Show.data("test/assets/example-pager.csv", %{"page" => 3, "page_size" => 15})

    assert expected == pager

  end

  test "spawn CSV file with pager on empty map" do

    expected = [60, "ul", [[32, "class", 61, 34, "pagination", 34], [32, "role", 61, 34, "pagination", 34]], 62, [
      [60, "li", [[32, "class", 61, 34, "current", 34]], 62,
        [60, "span", [[32, "class", 61, 34, "", 34]], 62, "1", 60, 47, "span", 62], 60, 47, "li", 62],
      [60, "li", [[32, "class", 61, 34, "", 34]], 62,
        [60, "a", [[32, "class", 61, 34, "", 34], [32, "href", 61, 34, "?page=2", 34]], 62, "2", 60, 47, "a", 62], 60, 47, "li", 62]
    ], 60, 47, "ul", 62]

    [safe: _, safe: pager] = CsvEditor.Show.data("test/assets/example-pager.csv", %{})

    assert expected == pager

  end

  test "spawn CSV file with page size is set to all" do

    expected = [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
      [[60, "thead", [], 62,
        [60, "tr", [], 62,
          [[60, "th", [], 62, "", 60, 47, "th", 62],
            [[60, "th", [], 62, "head 1", 60, 47, "th", 62],
            [60, "th", [], 62, "head 2", 60, 47, "th", 62],
            [60, "th", [], 62, "head 3", 60, 47, "th", 62]]], 60, 47, "tr", 62], 60,
        47, "thead", 62],
        [60, "tbody", [], 62,
          [[60, "tr", [], 62,
            [[60, "th", [], 62, "1", 60, 47, "th", 62],
            [[60, "td", [], 62, "cell 1", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 2", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 3", 60, 47, "td", 62]]], 60, 47, "tr", 62],
          [60, "tr", [], 62,
            [[60, "th", [], 62, "2", 60, 47, "th", 62],
            [[60, "td", [], 62, "cell 4", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 5", 60, 47, "td", 62],
            [60, "td", [], 62, "cell 6", 60, 47, "td", 62]]], 60, 47, "tr", 62]],
        60, 47, "tbody", 62]
      ], 60, 47, "table", 62]

    [{:safe, content}, []] = CsvEditor.Show.data("test/assets/example.csv", %{"page" => 1, "page_size" => "all"})

    assert expected == content

  end

  test "spawn log file" do

    expected = [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
      [[60, "tbody", [], 62,
        [[60, "tr", [], 62,
          [[60, "th", [], 62, "1", 60, 47, "th", 62],
          [[60, "td", [], 62, "first line", 60, 47, "td", 62]]], 60, 47, "tr", 62],
        [60, "tr", [], 62,
          [[60, "th", [], 62, "2", 60, 47, "th", 62],
          [[60, "td", [], 62, "second line", 60, 47, "td", 62]]], 60, 47, "tr", 62]],
        60, 47, "tbody", 62]],
      60, 47, "table", 62]

    [{:safe, content}, []] = CsvEditor.Show.data("test/assets/text.log", %{}, :txt)

    assert expected == content

  end

end
