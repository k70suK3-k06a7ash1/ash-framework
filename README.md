# Helpdesk
[Tutorial](https://hexdocs.pm/ash/get-started.html)

**iex**
```bash
iex -S mix

# Helpdesk.Support.Ticket |> Ash.Changeset.for_create(:create)|> Ash.create!()
Helpdesk.Support.Ticket |> Ash.Changeset.for_create(:open, %{subject: "My mouse won't click!"}) |> Ash.create!()


## Update

ticket = (  Helpdesk.Support.Ticket  |> Ash.Changeset.for_create(:open, %{subject: "My mouse won't click!"})  |> Ash.create!())

Ash.Changeset.for_update(:close)|> Ash.update!()

## Read
require Ash.Query

tickets =
  for i <- 0..5 do
    ticket =
      Helpdesk.Support.Ticket
      |> Ash.Changeset.for_create(:open, %{subject: "Issue #{i}"})
      |> Ash.create!()

    if rem(i, 2) == 0 do
      ticket
      |> Ash.Changeset.for_update(:close)
      |> Ash.update!()
    else
      ticket
    end
  end


## Find one(contain subject has "2")
Helpdesk.Support.Ticket|> Ash.Query.filter(contains(subject, "2"))|> Ash.DataLayer.Simple.set_data(tickets)|> Ash.read!()
```

## scaffold
```bash
mix ash.gen.domain MyApp.Accounts

```


- if you fix code, then exec this
```bash
iex -S mix
recompile()
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
