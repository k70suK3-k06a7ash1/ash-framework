import Config

config :helpdesk, :ash_domains, [MyApp.Accounts, Helpdesk.Support]

config :ash,
  include_embedded_source_by_default?: false,
  default_page_type: :keyset,
  custom_types: [ticket_status: Helpdesk.Support.Ticket.Types.Status]

config :ash, :policies, no_filter_static_forbidden_reads?: false
