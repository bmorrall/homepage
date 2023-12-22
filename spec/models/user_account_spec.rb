require "rails_helper"

RSpec.describe UserAccount do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:provider) }
  it { is_expected.to validate_presence_of(:uid) }
end
