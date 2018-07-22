defmodule UtilityBelt.MixProject do
  use Mix.Project

  @version File.cwd!() |> Path.join("version") |> File.read!() |> String.trim()
  @elixir_version File.cwd!() |> Path.join(".elixir_version") |> File.read!() |> String.trim()

  def project do
    [
      app: :utility_belt,
      version: @version,
      elixir: @elixir_version,
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Docs
      name: "UtilityBelt",
      source_url: "https://github.com/tyrchen/utility_belt",
      homepage_url: "https://github.com/tyrchen/utility_belt",
      docs: [
        main: "UtilityBelt",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # joken related
      {:joken, "~> 1.1"},
      {:libsodium, "> 0.0.0"},
      {:keccakf1600, "> 0.0.0"},
      # {:libdecaf, "> 0.0.0"},

      # comeonin related
      {:comeonin, "~> 4.0"},
      {:argon2_elixir, "~> 1.2"},
      {:bcrypt_elixir, "~> 1.0"},

      # dev & test
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.18", only: [:dev, :test]},
      {:pre_commit_hook, "~> 1.2", only: [:dev, :test]}
    ]
  end

  defp description do
    """
    A set of utility functions / macros.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "version", ".elixir_version"],
      licenses: ["MIT"],
      maintainers: ["tyr.chen@gmail.com"],
      links: %{
        "GitHub" => "https://github.com/tyrchen/utility_belt",
        "Docs" => "https://hexdocs.pm/utility_belt"
      }
    ]
  end
end
