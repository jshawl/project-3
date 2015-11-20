class Question < ActiveRecord::Base
  has_many :responses, dependent: :destroy
  has_many :users, :through => :responses
  has_many :colors
end
