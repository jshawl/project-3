class Response < ActiveRecord::Base
  belongs_to :questions
  # your models look good! What was the motivation for adding a color attribute on your question table?
  belongs_to :users
  has_many :colors
end
