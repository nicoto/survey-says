class Answer < ActiveRecord::Base
  # Remember to create a migration!

  validates :content, presence: true

  belongs_to :question
  has_many :select_answers

end
