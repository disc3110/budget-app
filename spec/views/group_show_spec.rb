require 'rails_helper'

RSpec.describe 'Log In', type: :feature do
  before do
    @user = User.find(1)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: '123456'
    end
    click_button 'Log in'
    visit '/groups/1'
  end

  describe 'transactions page' do
    it 'shows the right content' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Total on Food: $190.5')
      expect(page).to have_content('35.5')
      expect(page).to have_content('New Transaction')
    end
  end
end
