require "rails_helper"

RSpec.describe User do
  it { is_expected.to have_many(:user_accounts).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:email) }
end
