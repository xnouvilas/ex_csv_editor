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

  def data(file) when is_bitstring(file),
    do: data(file, default_page())

  def data({body}),
    do: data({[], body}, default_page())

  def data({header, body}),
    do: data({header, body}, default_page())

  def data({header, body}, nil),
    do: data({header, body}, default_page())

  def data(file, params) when is_bitstring(file),
    do: CsvEditor.decode(file) |> data(params)

  def data({body}, nil),
    do: data({[], body}, default_page())

  def data({body}, params),
    do: data({[], body}, params)

  def data({header, body}, nil),
    do: data({header, body}, default_page())

  def data({header, body}, params),
    do: data({header, body}, params, Scrivener.paginate(body, scrivener_config(params)))

  def data({header, _body}, params, pages),
    do: [table({header, pages.entries}, params), pager(pages, params, pages.total_pages)]


  defp table({_header, []}, _params),
    do: []

  defp table({header, entries}, params),
    do: content_tag(:table, content({header, entries}, params), [class: "csv-editor"])


  defp pager(pages, nil),
    do: pagination_links(pages, next: nil, previous: nil, first: true, last: true, view_style: :foundation)

  defp pager(pages, page_size),
    do: pagination_links(pages, page_size: page_size, next: nil, previous: nil, first: true, last: true, view_style: :foundation)

  defp pager(_pages, _params, 0),
    do: []

  defp pager(_pages, _params, 1),
    do: []

  defp pager(pages, params, _),
    do: pager(pages, params["page_size"])


  defp content({[], []}, _page),
    do: []

  defp content({[], body}, params),
    do: [body(body, params)]

  defp content({header, []}, _params),
    do: [header(header)]

  defp content({header, body}, params),
    do: [header(header), body(body, params)]


  defp header(header),
    do: content_tag(:thead, content_tag(:tr, [cell("", :th), Enum.map(header, fn(e) -> cell(e, :th) end)]))


  defp body(body, params),
    do: content_tag(:tbody, row(body, :td, params))


  defp row(contents, tag, params),
    do: Enum.with_index(contents) |> Enum.map(fn{c, index} -> row(c, tag, index, params) end)

  defp row(c, tag, index, params) when is_list(c),
    do: content_tag(:tr, [cell(row_index(params, index), :th), Enum.map(c, fn(e) -> cell(e, tag) end)])

  defp row(c, tag, _index, _page),
    do: cell(c, tag)


  defp cell(c, tag),
    do: content_tag(tag, c)


  defp scrivener_config(params),
    do: scrivener_config(params, {set_start_page(params["page"]), set_page_size(params["page_size"])})

  defp scrivener_config(_params, {page, page_size}),
    do: %Scrivener.Config{
      page_number: page,
      page_size: page_size
    }


  defp set_start_page,
    do: 1

  defp set_start_page(""),
    do: set_start_page()

  defp set_start_page(nil),
    do: set_start_page()

  defp set_start_page(page),
    do: page |> to_string |> String.to_integer


  defp set_page_size,
    do: 50

  defp set_page_size(""),
    do: set_page_size()

  defp set_page_size(nil),
    do: set_page_size()

  defp set_page_size("all"),
    do: 10_000_000

  defp set_page_size(page_size),
    do: page_size |> to_string |> String.to_integer


  defp default_page,
    do: %{"page" => 1}


  defp row_index(params, {nil, page_size, index}),
    do: row_index(params, {1, page_size, index})

  defp row_index(_params, {_page, "all", index}),
    do: index + 1

  defp row_index(_params, {page, page_size, index}),
    do: (set_start_page(page) - 1) * set_page_size(page_size) + index + 1

  defp row_index(params, index),
    do: row_index(params, {params["page"], params["page_size"], index})

end
