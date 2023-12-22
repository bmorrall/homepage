class UserAccount < ApplicationRecord
  belongs_to :user

  serialize :extra, coder: JSON

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
end
