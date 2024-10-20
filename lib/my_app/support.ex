defmodule MyApp.Support do
  use Ash.Domain

  resources do
    resource(MyApp.Support.Ticket)
  end
end
