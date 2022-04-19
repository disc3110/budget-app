require 'rails_helper'

RSpec.describe Deal, type: :model do
  before :each do
    @deal = Deal.new(name: 'drill', amount: 35  , user_id: 1)
  end
  it 'deal should be valid with correct parameters' do
    expect(@deal).to be_valid
  end

  it 'name should be present' do
    @deal.name = nil
    expect(@deal).to_not be_valid
  end

  it 'amount should be present' do
    @deal.amount = nil
    expect(@deal).to_not be_valid
  end

  it 'amount should be a number greater than 0' do
    @deal.amount = -5
    expect(@deal).to_not be_valid
  end
end
