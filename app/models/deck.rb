class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards
  belongs_to :user

  validates :name, presence: true
end
