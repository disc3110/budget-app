class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :deals
  before_destroy { deals.clear }

  validates :name, presence: true
  validates :icon, presence: true

  def expenses
    total = 0
    deals.each { |deal| total += deal.amount }
    total
  end

end
