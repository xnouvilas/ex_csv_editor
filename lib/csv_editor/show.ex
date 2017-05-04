defmodule CsvEditor.Show do
  @moduledoc """
  Documentation for CsvEditor.Show
  """

  @doc """
  CSV Editor Show Data

  ## Examples

      iex> CsvEditor.Show.data({["head 1", "head 2", "head 3"], [["cell 1", "cell 2", "cell 3"], ["cell 4", "cell 5", "cell 6"]]})
      [{:safe,
        [60, "table", [[32, "class", 61, 34, "csv-editor", 34]], 62,
          [[60, "thead", [], 62,
            [60, "tr", [], 62,
              [[60, "th", [], 62, "", 60, 47, "th", 62],
                [[60, "th", [], 62, "head 1", 60, 47, "th", 62],
                [60, "th", [], 62, "head 2", 60, 47, "th", 62],
                [60, "th", [], 62, "head 3", 60, 47, "th", 62]]], 60, 47,
            "tr", 62], 60, 47, "thead", 62],
          [60, "tbody", [], 62,
            [[60, "tr", [], 62,
              [[60, "th", [], 62, "1", 60, 47, "th", 62],
                [[60, "td", [], 62, "cell 1", 60, 47, "td", 62],
                  [60, "td", [], 62, "cell 2", 60, 47, "td", 62],
                  [60, "td", [], 62, "cell 3", 60, 47, "td", 62]]], 60, 47,
             "tr", 62],
            [60, "tr", [], 62,
              [[60, "th", [], 62, "2", 60, 47, "th", 62],
                [[60, "td", [], 62, "cell 4", 60, 47, "td", 62],
                  [60, "td", [], 62, "cell 5", 60, 47, "td", 62],
                  [60, "td", [], 62, "cell 6", 60, 47, "td", 62]]], 60, 47,
            "tr", 62]], 60, 47, "tbody", 62]], 60, 47, "table", 62]}, []]
  """

  import Phoenix.HTML.Tag
  import Scrivener.HTML

  def data(file) when is_bitstring(file), do: data(file, 1)
  def data({body}), do: data({[], body}, 1)
  def data({header, body}), do: data({header, body}, 1)
  def data(file, page) when is_bitstring(file) do
    decoder = CsvEditor.decode(file)

    data(decoder, page)
  end
  def data({body}, page), do: data({[], body}, page)
  def data({header, body}, page) do
    pages = Scrivener.paginate(body, scrivener_config(page))

    table = content_tag(:table, content({header, pages.entries}, page), [class: "csv-editor"])

    pager = case pages.total_pages do
      1 -> []
      _ -> pagination_links(pages, view_style: :foundation)
    end

    [table, pager]
  end

  defp content({header, body}, page), do: [header(header), body(body, page)]

  defp header(header), do:
    content_tag(:thead, content_tag(:tr, [cell("", :th), Enum.map(header, fn(e) -> cell(e, :th) end)]))

  defp body(body, page), do: content_tag(:tbody, row(body, :td, page))

  defp row(contents, tag, page) do
    Enum.with_index(contents)
    |> Enum.map(fn{c, index} -> row(c, tag, index, page) end)
  end
  defp row(c, tag, index, page) when is_list(c) do
    content_tag(:tr, [cell(row_index(page, index), :th), Enum.map(c, fn(e) -> cell(e, tag) end)])
  end
  defp row(c, tag, _index, _page), do: cell(c, tag)

  defp cell(c, tag), do: content_tag(tag, c)

  defp scrivener_config(page) when is_bitstring(page), do: scrivener_config(String.to_integer(page))
  defp scrivener_config(page), do: %Scrivener.Config{page_number: page, page_size: default_page_size()}

  defp default_page_size, do: 50

  defp row_index(page, index) when is_bitstring(page), do: row_index(String.to_integer(page), index)
  defp row_index(page, index), do: (page - 1) * default_page_size() + index + 1
end
