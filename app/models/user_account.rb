class UserAccount < ActiveRecord::Base
  belongs_to :user
  attr_accessible :provider, :uid
  attr_accessible :extra
  serialize :extra
  
  validates :provider, :presence => true
  validates :uid, :presence => true, :uniqueness => true
  validates :user, :presence => true
end
