class User < ActiveRecord::Base
  has_many :user_accounts

  attr_accessible :name

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable #, :registerable,
  # devise :recoverable, :rememberable, :trackable, :validatable
  devise :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    account = UserAccount.where(:provider => auth['provider'], :uid => auth["uid"]).first
    if account
      account.user
    else
      if signed_in_resource
        user = signed_in_resource
      else
        user = User.create(
          name: auth['extra']['user_hash']['name'],
          email: auth['extra']['user_hash']['email'],
          password: Devise.friendly_token[0,20]
        )
      end
      if user.persisted?
        user.user_accounts.create!(provider: auth['provider'], uid: auth['uid'])
      end
      user
    end
  end

end
