class Wiki < ApplicationRecord
  belongs_to :user
  validates :user, presence: true

  has_many :users, through: :collaborators
  has_many :collaborators, dependent: :destroy

  before_create :set_to_false_private

  def set_to_false_private
     self.private ||= false
  end

end
