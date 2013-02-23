require 'spec_helper'

describe User do
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:password) }

  describe "abilities" do
    require "cancan/matchers"

    subject { ability }
    let(:ability){ Ability.new(user) }
    let(:user){ nil }
    it { should_not be_able_to(:manage, Settings) }
    it { should_not be_able_to(:read, Settings) }
    it { should_not be_able_to(:update, Settings) }

    context "when is an user" do
      let(:user){ FactoryGirl.create(:user) }
      it { should_not be_able_to(:manage, Settings) }
      it { should_not be_able_to(:read, Settings) }
      it { should_not be_able_to(:update, Settings) }
    end
  end
end
