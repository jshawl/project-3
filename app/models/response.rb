class Response < ActiveRecord::Base
  has_many :questions
  has_many :users
  has_many :colors

end
