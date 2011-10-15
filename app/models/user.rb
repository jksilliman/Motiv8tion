class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # 
  devise :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :database_authenticatable, :registerable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :user_goals
  has_many :goals, :through => :user_goals



  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      user = User.new(:email => data["email"], :password => Devise.friendly_token[0,20])  
      user.first_name = data["first_name"]
      user.last_name = data["last_name"]
      user.fb_id = data["fb_id"]
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]    
        user.email = data["email"]
        user.first_name = data["first_name"]
        user.last_name = data["last_name"]
      end
    end
  end

  def name
    first_name + " " + last_name
  end

  def image_url
    "https://graph.facebook.com/#{self.fb_id}/picture"
  end
end
