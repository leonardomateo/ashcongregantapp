defmodule Church.Congregant do
  use Ash.Domain,
    otp_app: :church

  resources do
    resource Church.Congregant.Profile do
      define :create_profile, action: :create
      define :read_profile, action: :read
      define :get_profile_by_id, action: :read, get_by: :id
    end
  end
end
