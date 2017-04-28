# CSV Editor for Elixir (Phoenix)

Helpers built to work with [Phoenix](http://www.phoenixframework.org)'s page struct to easily work with CSV files.

## Setup

Add to `mix.exs`

```elixir
  # add :csv_editor to deps
  defp deps do
    [
      # ...
      {:csv_editor, "~> 0.1"}
      # ...
    ]
  end

  # add :csv_editor to applications list
  defp application do
    [
      # ...
      applications: [ ..., :csv_editor, ... ]
      # ...
    ]
  end
```

Configure Brunch `brunch-config.js`

```javascript
  # add csv_editor assets path to includePaths sass configuration
  exports.config = {
    plugins: {
      sass: {
        options: {
          includePaths: [
            'deps/csv_editor/web/static/sass'
          ]
        }
      }
    }
  };
```

Import default styles whatever you want

```sass
  @import "csv-editor"
```

## Example Usage

Use in your template.

```elixir
<%= CsvEditor.Show.data([], [["cell 1", "cell 2", "cell 3"], ["cell 4", "cell 5", "cell 6"]], ["col 1", "col 2", "col 3"]) %>

<%= CsvEditor.Show.data([], "test/assets/scrape-test-data.csv") %>
```
