require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @group = Group.new(name: 'Tools', icon: 'tool.png', user_id: 1)
  end
  it 'group should be valid with correct parameters' do
    expect(@group).to be_valid
  end

  it 'name should be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'icon should be present' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
