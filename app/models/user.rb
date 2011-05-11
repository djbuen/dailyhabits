class User < ActiveRecord::Base
  has_and_belongs_to_many :habits
  has_many :logs
end
