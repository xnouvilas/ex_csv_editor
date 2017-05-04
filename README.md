# CSV Editor for Elixir (Phoenix)

Helpers built to work with [Phoenix](http://www.phoenixframework.org)'s page struct to easily work with CSV files.

## Setup

Add to `mix.exs`

```elixir
  # add :csv_editor to deps
  defp deps do
    [
      # ...
      {:csv_editor, "~> 0.2"}
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

Use in your template (HAML).

```elixir
# Show with custom data
- header = ["col 1", "col 2", "col 3"]
- body = [["cell 1", "cell 2", "cell 3"], ["cell 4", "cell 5", "cell 6"]]
= CsvEditor.Show.data({header, body})

# Show without header and custom data
- body = [["cell 1", "cell 2", "cell 3"], ["cell 4", "cell 5", "cell 6"]]
= CsvEditor.Show.data({body})

# Show CSV file
= CsvEditor.Show.data("test/assets/scrape-test-data.csv")

# Show CSV file with scrivener pager
= CsvEditor.Show.data("test/assets/scrape-test-data.csv", @page)
```

## We've done

* Data Viewer without header
* Data Viewer with header
* Pagination through [Scrivener](https://github.com/drewolson/scrivener)

## TODO

* Tools to edit
* Export button (CSV)
* Export button (OTP / XLSX)
