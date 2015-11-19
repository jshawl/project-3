class Question < ActiveRecord::Base
  has_many :responses, dependent: :destroy
  has_many :users, :through => :responses
end
