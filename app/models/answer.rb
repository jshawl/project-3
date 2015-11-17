class Answer < ActiveRecord::Base
  has_many :values
  belongs_to :user
  belongs_to :question
end
