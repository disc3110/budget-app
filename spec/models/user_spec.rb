require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Diego', last_name: 'Solis', email: 'rspec@gmail.com', password: '123456')
  end

  it 'name should be valid with correct parameters' do
    expect(@user).to be_valid
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'last name should be present' do
    @user.last_name = nil
    expect(@user).to_not be_valid
  end
end
