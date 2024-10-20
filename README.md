# Helpdesk

**iex**
```bash
iex -S mix
Helpdesk.Support.Ticket |> Ash.Changeset.for_create(:open, %{subject: "My mouse won't click!"}) |> Ash.create!()
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `helpdesk` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:helpdesk, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/helpdesk>.

# ash-framework
