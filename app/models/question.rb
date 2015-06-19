class Question < ActiveRecord::Base
  # Remember to create a migration!

  validates :question, presence: true

  belongs_to :survey
  has_many :answers

end
