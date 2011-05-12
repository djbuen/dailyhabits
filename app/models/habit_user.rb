class HabitUser < ActiveRecord::Base
  belongs_to :habit
  belongs_to :user
  has_many :logs, :dependent => :destroy
end
