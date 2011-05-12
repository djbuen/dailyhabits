class Habit < ActiveRecord::Base
  has_many :user_habits, :class_name => 'HabitUser'
  has_many :users, :through => :user_habits
  belongs_to :category, :class_name => "Categories"
end
