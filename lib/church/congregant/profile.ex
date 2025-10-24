defmodule Church.Congregant.Profile do
  use Ash.Resource, otp_app: :church, domain: Church.Congregant, data_layer: AshPostgres.DataLayer

  postgres do
    table "profiles"
    repo Church.Repo
  end

  # Actions Block
  actions do
    create :create do
      accept [:first_name, :last_name]
    end

    read :read do
      primary? true
    end
  end

  # Attributes Block
  attributes do
    uuid_primary_key :id

    attribute :first_name, :string do
      allow_nil? false
    end

    attribute :last_name, :string do
      allow_nil? false
    end

    # Timestamps
    create_timestamp :inserted_at
    update_timestamp :updated_at
  end
end
