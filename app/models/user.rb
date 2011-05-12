class User < ActiveRecord::Base
  has_many :user_habits, :class_name => 'HabitUser'
  has_many :habits, :through => :user_habits
end
