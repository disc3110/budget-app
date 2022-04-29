class Deal < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups
  before_destroy { groups.clear }

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
