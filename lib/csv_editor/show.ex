defmodule CsvEditor.Show do
  @moduledoc """
  Documentation for CsvEditor.Show
  """

  @doc """
  CSV Editor Show Data

  ## Examples

      iex> CsvEditor.Show.data([], [["cell 1", "cell 2", "cell 3"], ["cell 4", "cell 5", "cell 6"]], ["head 1", "head 2", "head 3"])
      {:safe,
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

  """

  import Phoenix.HTML.Tag

  def data(options, file) when is_bitstring(file) do
    {header, body} = CsvEditor.decode(file)

    data(options, body, header)
  end
  def data(options, body, header \\ []) do
    content_tag(:table, content(body, header), [class: "csv-editor"])
  end

  defp content(body, header) do
    [header(header), body(body)]
  end

  defp header(header) do
    content_tag(:thead, content_tag(:tr, row(header, :th)))
  end

  defp body(body) do
    content_tag(:tbody, row(body, :td))
  end

  defp row(contents, tag) do
    Enum.map(contents, fn(c) -> row(contents, c, tag) end)
  end
  defp row(contents, c, tag) when is_list(c) do
    content_tag(:tr, Enum.map(c, fn(e) -> row(contents, e, tag) end))
  end
  defp row(contents, c, tag) do
    cell(c, tag)
  end

  defp cell(c, tag) do
    content_tag(tag, c)
  end

end
