class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :select_answers

end
