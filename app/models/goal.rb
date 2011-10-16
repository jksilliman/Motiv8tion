class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :order => "deadline asc"
  accepts_nested_attributes_for :tasks
end
