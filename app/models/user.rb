class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, uniqueness: true, presence: true
  validates :password_hash, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :surveys
  has_many :selected_answers

end
