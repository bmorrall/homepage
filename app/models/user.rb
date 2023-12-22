class User < ApplicationRecord
  has_many :user_accounts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :recoverable, :rememberable
  devise :database_authenticatable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [
    :facebook
  ]

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    account = UserAccount.where(provider: auth["provider"], uid: auth["uid"]).first
    if account
      account.user
    else
      user = signed_in_resource || User.create(
        name: auth["info"]["name"],
        email: auth["info"]["email"],
        password: Devise.friendly_token[0, 20]
      )
      if user.persisted?
        user.user_accounts.create!(
          extra: auth["info"].to_hash,
          provider: auth["provider"],
          uid: auth["uid"]
        )
      end
      user
    end
  end
end
