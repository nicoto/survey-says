class Survey < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, uniqueness: true, presence: true

  belongs_to :user
  has_many :questions

end
