require 'spec_helper'

describe UserAccount do
  it { should belong_to(:user) }
  it { should allow_mass_assignment_of(:provider) }
  it { should allow_mass_assignment_of(:uid) }
end
