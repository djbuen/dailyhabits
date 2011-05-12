class Log < ActiveRecord::Base
  belongs_to :user
  belongs_to :habit
  belongs_to :habit_user
end
