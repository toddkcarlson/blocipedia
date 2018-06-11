class Wiki < ApplicationRecord
  belongs_to :user
  validates :user, presence: true

  has_many :users, through: :collaborators
  has_many :collaborators, dependent: :destroy
end
