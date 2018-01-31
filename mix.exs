defmodule CsvEditor.Mixfile do
  use Mix.Project

  def project do
    [
      app: :csv_editor,
      version: "0.5.0",
      elixir: "~> 1.5.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:csv, "~> 1.4.2"},                   # Ultra-fast csv code/decode
      {:ex_doc, "~> 0.15", only: :dev},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_html, "~> 2.6"},
      {:scrivener_list, "~> 1.0"},          # A pagination library for the Elixir ecosystem
      {:scrivener_html, "~> 1.7", git: "https://github.com/xnouvilas/scrivener_html.git", branch: :develop},
    ]
  end

  defp description do
    """
    Helpers built to work with Phoenix's page struct to easily work with CSV files.
    """
  end

  defp package do
    [
      # These are the default files included in the package
      name: :ex_csv_editor,
      files: ["lib", "config", "mix.exs", "README*", "LICENSE", "web"],
      maintainers: ["Xavier Nouvilas"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/xnouvilas/ex_csv_editor"
      }
    ]
  end
end
