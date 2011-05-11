class User < ActiveRecord::Base
  acts_as_authentic
  has_many :todo_tasks
  accepts_nested_attributes_for :todo_tasks
  validates :index, :presence => true
end
