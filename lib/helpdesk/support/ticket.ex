# lib/helpdesk/support/ticket.ex

defmodule Helpdesk.Support.Ticket do
  # This turns this module into a resource
  use Ash.Resource, domain: Helpdesk.Support

  actions do
    # Use the default implementation of the :read action
    defaults([:read])

    # and a create action, which we'll customize later
    create(:create)

    create :open do
      accept([:subject])
    end

    update :close do
      # We don't want to accept any input here
      accept([])

      validate attribute_does_not_equal(:status, :closed) do
        message("Ticket is already closed")
      end

      change(set_attribute(:status, :closed))
      # A custom change could be added like so:
      #
      # change MyCustomChange
      # change {MyCustomChange, opt: :val}
    end
  end

  # Attributes are the simple pieces of data that exist on your resource
  attributes do
    # Add an autogenerated UUID primary key called `:id`.
    uuid_primary_key(:id)

    # Add a string type attribute called `:subject`
    attribute :subject, :string do
      # Don't allow `nil` values
      allow_nil?(false)

      # Allow this attribute to be public. By default, all attributes are private.
      public?(true)
    end

    attribute :status, :atom do
      # Constraints allow you to provide extra rules for the value.
      # The available constraints depend on the type
      # See the documentation for each type to know what constraints are available
      # Since atoms are generally only used when we know all of the values
      # it provides a `one_of` constraint, that only allows those values
      constraints(one_of: [:open, :closed])

      # The status defaulting to open makes sense
      default(:open)

      # We also don't want status to ever be `nil`
      allow_nil?(false)
    end
  end
end
