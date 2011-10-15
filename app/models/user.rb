class User < ActiveRecord::Base
  has_many :user_goals
  has_many :goals, :through => :user_goals
end
