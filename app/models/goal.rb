class Goal < ActiveRecord::Base
  has_many :user_goals
  has_many :users, :through => :user_goals
end
