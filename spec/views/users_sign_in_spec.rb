require 'rails_helper'

RSpec.describe 'Log In', type: :feature do
  before do
    @user = User.find(1)
    visit '/users/sign_in'
  end

  describe 'log in page' do
    it 'shows the right content' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_content('Remember me')
      expect(page).to have_button('Log in')
    end

    it 'logs me in' do
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_content('Remember me')
      expect(page).to have_button('Log in')
    end

    it 'signs me in' do
      within('#new_user') do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
