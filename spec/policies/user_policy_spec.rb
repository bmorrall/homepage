require "rails_helper"

RSpec.describe UserPolicy do
  subject { described_class.new(current_user, user) }

  let(:user) { instance_double(User, id: 123) }

  context "with visitors" do
    let(:current_user) { nil }

    it { is_expected.to forbid_all_actions }
  end

  context "with current user matching the user" do
    let(:current_user) { user }

    it { is_expected.to permit_only_actions(:show) }
  end

  context "with a different current user" do
    let(:current_user) { instance_double(User, id: 456) }

    it { is_expected.to forbid_all_actions }
  end
end
