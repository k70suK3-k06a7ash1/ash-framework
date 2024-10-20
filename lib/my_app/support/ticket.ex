defmodule MyApp.Support.Ticket do
  use Ash.Resource, otp_app: :helpdesk, domain: MyApp.Support, data_layer: AshPostgres.DataLayer

  actions do
    defaults([:read])
  end

  attributes do
    uuid_primary_key(:id)

    attribute :subject, :string do
      allow_nil?(false)
      public?(true)
    end

    timestamps()
  end

  relationships do
    belongs_to(:representative, Helpdesk.Support.Representative)
  end

  postgres do
    table("tickets")
    repo(Helpdesk.Repo)
  end
end
