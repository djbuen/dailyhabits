class Habit < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :category, :class_name => "Categories"
end
