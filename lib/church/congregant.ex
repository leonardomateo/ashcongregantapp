defmodule Church.Congregant do
  use Ash.Domain,
    otp_app: :church

  resources do
    resource Church.Congregant.Profile do
     define :create_profile, action: :create
    end
  end
end
