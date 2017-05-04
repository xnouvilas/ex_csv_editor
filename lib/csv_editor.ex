defmodule CsvEditor do
  @moduledoc """
  Documentation for CsvEditor.
  """

  def decode(file_path), do: decode(file_path, define_separator(file_path))
  def decode(file_path, separator) do
    header = decode_header(file_path, separator)

    {header, decode_stream(file_path, separator) |> Stream.drop(1) |> Enum.to_list}
  end

  def decode_header(file_path, separator \\ ?;), do: decode_stream(file_path, separator) |> Enum.take(1) |> List.first

  def decode_stream(file_path, separator \\ ?;), do: File.stream!(file_path) |> CSV.decode(separator: separator) |> Enum.to_list

  def define_separator(file_path) do
    semicolon_count = File.stream!(file_path)
      |> Enum.take(1)
      |> CSV.decode(separator: ?;)
      |> Enum.to_list
      |> hd
      |> Enum.count

    case semicolon_count do
      1 -> ?,
      _ -> ?;
    end
  end
end
